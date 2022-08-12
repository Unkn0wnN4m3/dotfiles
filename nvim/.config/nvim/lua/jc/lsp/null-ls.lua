local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	debug = false,
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
					vim.lsp.buf.formatting_sync()
				end,
			})
		end
	end,
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
		formatting.yapf,

		-- diagnostics.mypy.with({
		-- 	condition = function(utils)
		-- 		return utils.root_has_file({
		-- 			"setup.py",
		-- 			"setup.cfg",
		-- 			"Pipfile",
		-- 			"requirements.txt",
		-- 			"pyproject.toml",
		-- 		})
		-- 	end,
		-- }),

		-- Fish
		formatting.fish_indent,
	},
})
