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
            { 'williamboman/mason-lspconfig.nvim' },
            {
                'jose-elias-alvarez/null-ls.nvim',
                branch = "0.7-compat",
                dependencies =
                {
                    "nvim-lua/plenary.nvim",
                    version = "v0.*"
                },
            },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'L3MON4D3/LuaSnip' },
        },
        config = function()
            local util = require 'lspconfig.util'
            local lsp = require('lsp-zero').preset({})

            lsp.on_attach(function(client, bufnr)
                lsp.default_keymaps({ buffer = bufnr })

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
                handlers = {
                    ["textDocument/publishDiagnostics"] = vim.lsp.with(
                        vim.lsp.diagnostic.on_publish_diagnostics, {
                            -- Disable virtual_text
                            virtual_text = false
                        }
                    ),
                },
                filetypes = {
                    'javascript',
                    'javascriptreact',
                    'javascript.jsx',
                    'typescript',
                    'typescriptreact',
                    'typescript.tsx',
                },
                root_dir = function(fname)
                    return util.root_pattern 'tsconfig.json' (fname)
                        or util.root_pattern('package.json', 'jsconfig.json', '.git')(fname)
                end,
                single_file_support = true
            })

            local eslint_root_file = {
                '.eslintrc',
                '.eslintrc.js',
                '.eslintrc.cjs',
                '.eslintrc.yaml',
                '.eslintrc.yml',
                '.eslintrc.json',
                'eslint.config.js',
            }

            require 'lspconfig'.eslint.setup({
                root_dir = function(fname)
                    eslint_root_file = util.insert_package_json(eslint_root_file, 'eslintConfig', fname)
                    return util.root_pattern(unpack(eslint_root_file))(fname)
                end,
                settings = {
                    packageManager = 'pnpm',
                    codeActionOnSave = {
                        enable = false,
                        mode = 'all',
                    },
                    format = false,
                    codeAction = {
                        disableRuleComment = {
                            enable = true,
                            location = 'separateLine',
                        },
                        showDocumentation = {
                            enable = true,
                        },
                    }
                },
            })

            require('lspconfig').cssls.setup({})
            require('lspconfig').jsonls.setup({})
            require('lspconfig').html.setup({ filetypes = { 'html', 'jinja.html', 'htmldjango' } })
            require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

            lsp.setup()

            -- vim.diagnostic.config({
            --     virtual_text = {
            --         severity = vim.diagnostic.severity.ERROR,
            --         source = "if_many"
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
                    -- Replace these with the tools you have installed
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
