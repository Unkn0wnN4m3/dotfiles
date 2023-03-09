return {
    -- Lsp
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = "v1.x",
        dependencies = {

            -- LSP Support
            {
                'neovim/nvim-lspconfig',
                tag = "v0.1.5"
            },
            {
                'williamboman/mason.nvim',
                commit = "5e78970539d937b7aef7a4e10b219d60da0b1425"
            },
            {
                'williamboman/mason-lspconfig.nvim',
                commit = "610f5919fe633ac872239a0ab786572059f0d91d"
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
                'sumneko_lua',
                'pyright',
                'tsserver',
                'jsonls',
                'html',
                'cssls'
            })

            lsp.configure('pyright', {
                settings = {
                    python = {
                        analysis = {
                            typeCheckingMode = "basic",
                        },
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
            --
            -- lsp.configure('denols', {
            --     root_dir = util.root_pattern("deno.json", "deno.jsonc"),
            --     single_file_support = false,
            -- })

            -- Configure lua language server for neovim
            lsp.nvim_workspace()

            lsp.setup()

            vim.diagnostic.config({
                virtual_text = {
                    source = "if_many",
                    severity = { min = vim.diagnostic.severity.WARN },
                    spacing = 2,
                    prefix = "",
                },
            })

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
}
