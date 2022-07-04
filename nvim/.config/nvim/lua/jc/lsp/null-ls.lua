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
		-- prettier
		formatting.prettier.with({
			prefer_local = "node_modules/.bin",
			extra_filetypes = { "toml" },
			extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
			condition = function(utils)
				return utils.root_has_file({
					"package.json",
					"jsconfig.json",
					"tsconfig.json",
					".git",
				})
			end,
		}),

		-- Lua
		formatting.stylua.with({
			extra_args = {
				"--indent-type",
				"Tabs",
				"--indent-width",
				"4",
			},
		}),

		-- Python
		formatting.yapf.with({
			command = virtualenvs .. "yapf",
		}),
		formatting.djhtml.with({
			command = virtualenvs .. "djhtml",
		}),
		diagnostics.flake8.with({
			command = virtualenvs .. "flake8",
			condition = function(utils)
				return utils.root_has_file({
					"setup.py",
					"setup.cfg",
					"Pipfile",
					"requirements.txt",
					"pyproject.toml",
				})
			end,
		}),

		-- Fish
		formatting.fish_indent,
	},
})
