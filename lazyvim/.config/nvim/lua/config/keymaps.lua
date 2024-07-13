local map = vim.keymap

-- exit insert mode
map.set("i", "jk", "<ESC>", { noremap = true, silent = true })
map.set("i", "kj", "<ESC>", { noremap = true, silent = true })

map.set("n", "]b", "<CMD>bnext<CR>", { noremap = true, silent = true, desc = "Next buffer" })
map.set("n", "[b", "<CMD>bprev<CR>", { noremap = true, silent = true, desc = "Prev buffer" })

-- Delete maps
map.del("n", "<C-J>")
map.del("n", "<C-K>")
