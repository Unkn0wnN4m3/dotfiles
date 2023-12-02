local map = vim.keymap.set

-- exit insert mode
map("i", "jk", "<ESC>", { noremap = true, silent = true })
map("i", "kj", "<ESC>", { noremap = true, silent = true })

map("n", "]b", "<CMD>bnext<CR>", { noremap = true, silent = true, desc = "Next buffer" })
map("n", "[b", "<CMD>bprev<CR>", { noremap = true, silent = true, desc = "Prev buffer" })

-- Delete maps
vim.keymap.del({ "n", "t" }, "<C-l>")
vim.keymap.del({ "n", "t" }, "<C-h>")
vim.keymap.del("n", "<C-J>")
vim.keymap.del("n", "<C-K>")
