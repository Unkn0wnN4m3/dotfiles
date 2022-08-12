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
keymap('n', '<leader>ww', ':w<CR>', opts)

-- Exit
keymap('n', '<leader>qq', ':q<CR>', opts)
keymap('n', '<leader>qa', ':qa<CR>', opts)

-- exit insert mode
keymap('i', 'jk', '<ESC>', opts)
keymap('i', 'kj', '<ESC>', opts)

-- Pressing the letter o will open a new line below the current one.
-- Exit insert mode after creating a new line above or below the current line.
keymap('n', 'o', 'o<ESC>', opts)
keymap('n', 'O', 'O<ESC>', opts)

-- Moving text
keymap('v', 'J', ':m \'>+1<CR>gv=gv', term_opts)
keymap('v', 'K', ':m \'<-2<CR>gv=gv', term_opts)

-- You can split the window in Vim by typing :split or :vsplit.
-- Navigate the split view easier by pressing CTRL+j, CTRL+k, CTRL+h, or CTRL+l.
keymap('n', '<C-j>', '<C-w>j', term_opts)
keymap('n', '<C-k>', '<C-w>k', term_opts)
keymap('n', '<C-h>', '<C-w>h', term_opts)
keymap('n', '<C-l>', '<C-w>l', term_opts)

-- Resizing Windows
keymap('n', '<C-Up>',    ':resize -2<CR>', opts)
keymap('n', '<C-Down>',  ':resize +2<CR>', opts)
keymap('n', '<C-Left>',  ':vertical resize -2<CR>', opts)
keymap('n', '<C-Right>', ':vertical resize +2<CR>', opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Close buffers
keymap("n", "<S-q>", "<cmd>Bdelete!<CR>", opts)

-- Navigate Tabs
keymap("n", "<Tab>", ":tabNext<CR>", opts)
keymap("n", "<S-Tab>", ":tabprevious<CR>", opts)
keymap("n", "te", ":tabedit<CR>", opts)
keymap("n", "tc", ":tabclose<CR>", opts)

-- Better tabing
keymap('v', '<', '<gv',  opts)
keymap('v', '>', '>gv',  opts)

-- Clear highlights
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)

-- NvimTree
-- keymap("n", "<F3>", ":NvimTreeToggle<CR>", opts)

-- Telescope
keymap("n", "<leader>tf", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>tg", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>tp", ":Telescope projects<CR>", opts)
keymap("n", "<leader>tb", ":Telescope buffers<CR>", opts)

-- DAP
-- keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
-- keymap("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", opts)
-- keymap("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", opts)
-- keymap("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", opts)
-- keymap("n", "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>", opts)
-- keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", opts)
-- keymap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", opts)
-- keymap("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", opts)
-- keymap("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", opts)
