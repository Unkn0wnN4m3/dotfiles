return {
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        lazy = true,
        config = function()
            -- This is where you modify the settings for lsp-zero
            -- Note: autocompletion settings will not take effect

            require('lsp-zero.settings').preset({})
        end
    },

    -- Autocompletion
    {
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
        dependencies = {
            { 'L3MON4D3/LuaSnip' },
        },
        config = function()
            -- Here is where you configure the autocompletion settings.
            -- The arguments for .extend() have the same shape as `manage_nvim_cmp`:
            -- https://github.com/VonHeikemen/lsp-zero.nvim/blob/v2.x/doc/md/api-reference.md#manage_nvim_cmp

            require('lsp-zero.cmp').extend()

            -- And you can configure cmp even more, if you want to.
            local cmp = require('cmp')
            local cmp_action = require('lsp-zero.cmp').action()

            cmp.setup({
                mapping = {
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
                    ['<C-b>'] = cmp_action.luasnip_jump_backward(),
                }
            })
        end
    },

    -- LSP
    {
        'neovim/nvim-lspconfig',
        cmd = 'LspInfo',
        event = { 'BufReadPre', 'BufNewFile' },
        dependencies = {
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'williamboman/mason-lspconfig.nvim' },
            {
                'williamboman/mason.nvim',
                build = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            {
                'jose-elias-alvarez/null-ls.nvim',
                branch = "0.7-compat",
                dependencies =
                {
                    "nvim-lua/plenary.nvim",
                    version = "v0.*"
                },
            },
        },
        config = function()
            -- This is where all the LSP shenanigans will live

            local lsp = require('lsp-zero')
            local util = require 'lspconfig.util'

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
                    -- packageManager = 'pnpm',
                    -- codeActionOnSave = {
                    --     enable = false,
                    --     mode = 'all',
                    -- },
                    format = false,
                    -- codeAction = {
                    --     disableRuleComment = {
                    --         enable = true,
                    --         location = 'separateLine',
                    --     },
                    --     showDocumentation = {
                    --         enable = true,
                    --     },
                    -- }
                },
            })

            require('lspconfig').cssls.setup({})
            require('lspconfig').jsonls.setup({})
            require('lspconfig').html.setup({ filetypes = { 'html', 'jinja.html', 'htmldjango' } })
            require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

            lsp.format_mapping('gq', {
                format_opts = {
                    async = false,
                    timeout_ms = 10000,
                },
                servers = {
                    ["null-ls"] = {
                        "python",
                        "javascript",
                        "javascriptreact",
                        "typescriptreact",
                        "typescript",
                        "css",
                        "json",
                        "jsonc",
                        "markdown",
                        "html",
                        "jinja.html",
                        "htmldjango"
                    },
                    ["lua_ls"] = { "lua" }
                }
            })

            lsp.setup()

            local null_ls = require('null-ls')
            local formatting = null_ls.builtins.formatting

            null_ls.setup({
                sources = {
                    formatting.prettier,
                    formatting.yapf,
                    formatting.isort,
                    formatting.djlint,
                    formatting.fish_indent
                }
            })
        end
    }
}
