local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

local virtualenvs = vim.fn.expand("~/.virtualenvs/python-lsp/venv/bin/")

null_ls.setup({
  debug = false,
  sources = {
    -- formatting.prettier.with {
    --   extra_filetypes = { "toml" },
    --   extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
    -- },

    -- Lua
    formatting.stylua.with({
      extra_args = {
        "--indent-type",
        "Spaces",
        "--indent-width",
        "2",
      },
    }),

    -- Python
    formatting.black.with({
      command = virtualenvs .. "black",
      extra_args = { "--fast" },
    }),
    diagnostics.flake8.with({
      command = virtualenvs .. "flake8",
    }),

    -- Jinja2
    diagnostics.djlint.with({
      command = virtualenvs .. "djlint",
    }),
    formatting.djlint.with({
      command = virtualenvs .. "djlint",
    }),
  },
})
