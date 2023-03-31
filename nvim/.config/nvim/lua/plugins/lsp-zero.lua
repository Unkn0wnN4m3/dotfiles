return {
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        dependencies = {
            -- LSP Support
            { 'neovim/nvim-lspconfig', },
            {
                'williamboman/mason.nvim',
                build = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            {'williamboman/mason-lspconfig.nvim'},
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
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'L3MON4D3/LuaSnip'},
        },
        config = function()
            local util = require 'lspconfig.util'
            local lsp = require('lsp-zero').preset({})

            lsp.on_attach(function(client, bufnr)
                lsp.default_keymaps({buffer = bufnr})

                if client.server_capabilities["documentSymbolProvider"] then
                    require("nvim-navic").attach(client, bufnr)
                end
            end)

            -- Python

            local root_files = {
                'pyproject.toml',
                'setup.py',
                'setup.cfg',
                'requirements.txt',
                'Pipfile',
                'pyrightconfig.json',
                '.git'
            }

            require('lspconfig').pyright.setup({
                single_file_support = true,
                root_dir = util.root_pattern(unpack(root_files)),
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

            -- tsserver

            require('lspconfig').tsserver.setup({
                init_options = { hostInfo = 'neovim' },
                filetypes = {
                    'javascript',
                    'javascriptreact',
                    'javascript.jsx',
                    'typescript',
                    'typescriptreact',
                    'typescript.tsx',
                },
                root_dir = function(fname)
                    return util.root_pattern 'tsconfig.json'(fname)
                    or util.root_pattern('package.json', 'jsconfig.json', '.git')(fname)
                end,
                single_file_support = true
            })

            require('lspconfig').jsonls.setup({})
            require('lspconfig').cssls.setup({})
            require('lspconfig').html.setup({})
            require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

            lsp.setup()

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
    }
}
