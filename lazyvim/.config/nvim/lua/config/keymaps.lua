local map = vim.keymap

-- Delete keykmaps
map.del("n", "<S-h>")
map.del("n", "<S-l>")
map.del("n", "]b")
map.del("n", "[b")

-- Add keymaps
map.set("i", "jk", "<ESC>", { noremap = true, silent = true })
map.set("i", "kj", "<ESC>", { noremap = true, silent = true })

map.set("n", "]b", "<CMD>bnext<CR>", { noremap = true, silent = true, desc = "Next buffer" })
map.set("n", "[b", "<CMD>bprev<CR>", { noremap = true, silent = true, desc = "Prev buffer" })
