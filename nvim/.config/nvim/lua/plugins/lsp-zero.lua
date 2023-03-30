return {
    -- Lsp
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = "v1.x",
        -- priority = 999, -- make sure to load this before all the other start plugins
        dependencies = {

            -- LSP Support
            {
                'neovim/nvim-lspconfig',
                tag = "v0.1.6"
            },
            {
                'williamboman/mason.nvim',
                commit = "fdf33558c4386516150748670fde10ea39a7d86f"
            },
            {
                'williamboman/mason-lspconfig.nvim',
                commit = "b64fdede85fd5e0b720ce722919e0a9b95ed6547"
            },
            {
                'jose-elias-alvarez/null-ls.nvim',
                commit = '7bd74a821d991057ca1c0ca569d8252c4f89f860',
                dependencies =
                {
                    "nvim-lua/plenary.nvim",
                    tag = "v0.1.2"
                },
            },

            -- Style
            {
                "j-hui/fidget.nvim",
                commit = "0ba1e16d07627532b6cae915cc992ecac249fb97",
                config = true
            },

            -- Autocompletion
            {
                'hrsh7th/nvim-cmp',
                tag = "v0.0.1",
                dependencies = {
                    {
                        'hrsh7th/cmp-nvim-lsp',
                        commit = "59224771f91b86d1de12570b4070fe4ad7cd1eeb",
                    },
                    {
                        'hrsh7th/cmp-buffer',
                        commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa",
                    },
                    {
                        'hrsh7th/cmp-path',
                        commit = "91ff86cd9c29299a64f968ebb45846c485725f23",
                    },
                    {
                        'saadparwaiz1/cmp_luasnip',
                        commit = "18095520391186d634a0045dacaa346291096566",
                    },
                    {
                        'hrsh7th/cmp-nvim-lua',
                        commit = "f3491638d123cfd2c8048aefaf66d246ff250ca6",
                    },

                    -- Snippets
                    {
                        'L3MON4D3/LuaSnip',
                        tag = "v1.1.0",
                    },
                    {
                        'rafamadriz/friendly-snippets',
                        commit = "320865dfe76c03a5c60513d4f34ca22effae56f2",
                    },

                }
            },
        },
        config = function()
            local util = require('lspconfig.util')
            local lsp = require('lsp-zero').preset({
                name = 'recommended',
                -- set_lsp_keymaps = true,
                -- manage_nvim_cmp = true,
                suggest_lsp_servers = false,
            })

            lsp.ensure_installed({
                'pyright',
                'tsserver',
                'jsonls',
                'html',
                'cssls'
            })

            lsp.on_attach(function(client, bufnr)
                if client.server_capabilities["documentSymbolProvider"] then
                    require("nvim-navic").attach(client, bufnr)
                end
            end)

            lsp.configure('pyright', {
                settings = {
                    python = {
                        analysis = {
                            typeCheckingMode = "basic",
                            autoSearchPaths = true,
                            useLibraryCodeForTypes = true,
                            diagnosticMode = 'workspace',
                        },
                        disableOrganizeImports = true,
                        venvPath = vim.fn.expand("$WORKON_HOME")
                    },
                },
            })

            lsp.configure('html', {
                filetypes = { 'html', 'jinja.html' }
            })

            lsp.configure('tsserver', {
                root_dir = util.root_pattern("package.json"),
                single_file_support = false,
            })

            -- Configure lua language server for neovim
            -- lsp.nvim_workspace()

            lsp.setup()

            -- vim.diagnostic.config({
            --     virtual_text = {
            --         source = "if_many",
            --         severity = { min = vim.diagnostic.severity.WARN },
            --         spacing = 2,
            --         prefix = "",
            --     },
            -- })

            local null_ls = require('null-ls')
            local null_opts = lsp.build_options('null-ls', {})
            local formatting = null_ls.builtins.formatting

            local prettier_local = 'node_modules/.bin'
            if vim.fn.has 'win32' == 1 then
                prettier_local = 'node_modules\\.bin'
            end

            null_ls.setup({
                on_attach = function(client, bufnr)
                    null_opts.on_attach(client, bufnr)

                    local format_cmd = function(input)
                        vim.lsp.buf.format({
                            id = client.id,
                            timeout_ms = 5000,
                            async = input.bang,
                        })
                    end

                    local bufcmd = vim.api.nvim_buf_create_user_command
                    bufcmd(bufnr, 'NullFormat', format_cmd, {
                        bang = true,
                        range = true,
                        desc = 'Format using null-ls'
                    })
                end,
                sources = {
                    --- Replace these with the tools you have installed
                    formatting.prettier.with({
                        prefer_local = prettier_local,
                        condition = function(utils)
                            return utils.root_has_file({
                                "package.json",
                            })
                        end,
                    }),
                    formatting.yapf,
                    formatting.isort,
                    formatting.djlint,
                    formatting.fish_indent
                }
            })
        end
    },

    -- Interface
    {
        "utilyre/barbecue.nvim",
        name = "barbecue",
        tag = "v0.4.2",
        dependencies = {
            {
                "SmiteshP/nvim-navic",
                commit = "cdd24539bcf114a499827e9b32869fe74836efe7",
            },
            { "nvim-tree/nvim-web-devicons" }
        },
        config = function()
            require("barbecue").setup({
                create_autocmd = false,
                attach_navic = false,
            })

            vim.api.nvim_create_autocmd({
                "BufWinEnter",
                "CursorHold",
                "InsertLeave",
            }, {
                group = vim.api.nvim_create_augroup("barbecue.updater", {}),
                callback = function()
                    require("barbecue.ui").update()
                end,
            })
        end
    },
}
