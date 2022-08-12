local status, saga = pcall(require, "lspsaga")
if not status then
	return
end

local action = require("lspsaga.codeaction")

saga.init_lsp_saga({
	server_filetype_map = {
		typescript = "typescript",
	},
	code_action_lightbulb = {
		enable = true,
		sign = true,
		enable_in_insert = false,
		sign_priority = 20,
		virtual_text = false,
	},
})

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "K", "<Cmd>Lspsaga hover_doc<CR>", opts)
vim.keymap.set("n", "gl", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
vim.keymap.set("n", "<leader>la", action.code_action, opts)
-- vim.keymap.set('n', 'gd', '<Cmd>Lspsaga lsp_finder<CR>', opts)
-- vim.keymap.set('i', '<C-k>', '<Cmd>Lspsaga signature_help<CR>', opts)
