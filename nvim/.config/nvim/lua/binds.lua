--[[ ===========================================
    ____  _           __       __
   / __ )(_)___  ____/ /____  / /_  ______ _
  / __  / / __ \/ __  / ___/ / / / / / __ `/
 / /_/ / / / / / /_/ (__  ) / / /_/ / /_/ /
/_____/_/_/ /_/\__,_/____(_)_/\__,_/\__,_/
================================================ ]]

--- Setup {{{

-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local term_opts = { silent = true }

local opts = { noremap = true, silent = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

--- }}}

-- [[ General Bindings ]]

-- Saving
keymap("n", "<leader>ww", ":w<CR>", opts)
keymap("n", "<leader>wa", ":confirm wa<CR>", opts)

-- Exit
keymap("n", "<leader>qq", ":confirm q<CR>", opts)
keymap("n", "<leader>qa", ":confirm qa<CR>", opts)

-- exit insert mode
keymap("i", "jk", "<ESC>", opts)
keymap("i", "kj", "<ESC>", opts)

-- Pressing the letter o will open a new line below the current one.
-- Exit insert mode after creating a new line above or below the current line.
keymap("n", "o", "o<ESC>", opts)
keymap("n", "O", "O<ESC>", opts)

-- Moving text
keymap("v", "J", ":m '>+1<CR>gv=gv", term_opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", term_opts)

-- You can split the window in Vim by typing :split or :vsplit.
-- Navigate the split view easier by pressing CTRL+j, CTRL+k, CTRL+h, or CTRL+l.
keymap("n", "<C-j>", "<C-w>j", term_opts)
keymap("n", "<C-k>", "<C-w>k", term_opts)
keymap("n", "<C-h>", "<C-w>h", term_opts)
keymap("n", "<C-l>", "<C-w>l", term_opts)

-- Resizing Windows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate Tabs

-- It's better if gt or gT to navigate between tabs
-- keymap("n", "gn", "<CMD>tabnext<CR>", opts)
-- keymap("n", "gp", "<CMD>tabprevious<CR>", opts)
keymap("n", "tc", "<CMD>tabclose<CR>", opts)

-- Better tabing
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Clear highlights
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)

vim.api.nvim_create_user_command('ShowLocation', 'echo @%', {})
