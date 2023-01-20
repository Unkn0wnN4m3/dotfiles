local lsp = require('lsp-zero')
lsp.preset('recommended')

lsp.ensure_installed({
    'sumneko_lua',
    'pyright',
    'tsserver'
})

lsp.configure('pyright', {
    settings = {
        python = {
            analysis = {
                typeCheckingMode = "basic",
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = "workspace",
            },
        },
    },
})

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
            extra_filetypes = { "toml" },
            extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
            condition = function(utils)
                return utils.root_has_file({
                    "package.json",
                    "jsconfig.json",
                    "tsconfig.json",
                    ".git"
                })
            end,
        }),
        formatting.yapf,
        formatting.isort,
    }
})
