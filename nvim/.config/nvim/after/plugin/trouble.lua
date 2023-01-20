local status, trouble = pcall(require, "trouble")
if (not status) then return end

local keymap = vim.api.nvim_set_keymap
local opts = { silent = true, noremap = true }

-- Lua
keymap("n", "<leader>xx", "<cmd>Trouble<cr>", opts)
keymap("n", "<leader>xw", "<cmd>Trouble workspace_diagnostics<cr>", opts)
keymap("n", "<leader>xd", "<cmd>Trouble document_diagnostics<cr>", opts)
keymap("n", "gR", "<cmd>Trouble lsp_references<cr>", opts)

trouble.setup()
