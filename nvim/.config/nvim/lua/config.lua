--[[ ===============================================================
   ______            _____         __
  / ____/___  ____  / __(_)___ _  / /_  ______ _
 / /   / __ \/ __ \/ /_/ / __ `/ / / / / / __ `/
/ /___/ /_/ / / / / __/ / /_/ / / / /_/ / /_/ /
\____/\____/_/ /_/_/ /_/\__, (_)_/\__,_/\__,_/
                       /____/
==================================================================== ]]
-- General

vim.opt.backup = false         -- creates a backup file
-- vim.opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
vim.opt.cmdheight = 2          -- more space in the neovim command line for displaying messages
vim.opt.fileencoding = "utf-8" -- the encoding written to a file
vim.opt.hlsearch = true        -- highlight all matches on previous search pattern
vim.opt.ignorecase = true      -- ignore case in search patterns
vim.opt.pumheight = 10         -- pop up menu height
vim.opt.showmode = false       -- we don't need to see things like -- INSERT -- anymore
vim.opt.smartcase = true       -- smart case
vim.opt.smartindent = true     -- make indenting smarter again
vim.opt.splitbelow = true      -- force all horizontal splits to go below current window
vim.opt.splitright = true      -- force all vertical splits to go to the right of current window
vim.opt.swapfile = false       -- creates a swapfile
vim.opt.termguicolors = true   -- set term gui colors (most terminals support this)
vim.opt.timeoutlen = 1000      -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.undofile = true        -- enable persistent undo
vim.opt.updatetime = 300       -- faster completion (4000ms default)
vim.opt.writebackup = false    -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
vim.opt.expandtab = true       -- convert tabs to spaces
-- vim.opt.shiftwidth = 4         -- the number of spaces inserted for each indentation
-- vim.opt.tabstop = 4            -- insert 4 spaces for a tab
vim.opt.number = true -- set numbered lines
vim.opt.laststatus = 3
-- vim.opt.showcmd = false
vim.opt.ruler = false
vim.opt.signcolumn = "yes" -- always show the sign column, otherwise it would shift the text each time
vim.opt.wrap = false       -- display lines as one long line
vim.opt.scrolloff = 15     -- left 15 lines top and button
vim.opt.foldenable = true  -- Folds
vim.opt.foldmethod = "marker"
vim.opt.sidescrolloff = 8
vim.opt.shortmess:append("c")
vim.opt.whichwrap:append("<,>,[,],h,l")
vim.opt.iskeyword:append("-")
vim.opt.backspace = { 'start', 'eol', 'indent' }
vim.opt.path:append { '**' } -- Finding files - Search down into subfolders
vim.opt.wildignore:append { '*/node_modules/*', '*.pyc', '*/__pycache__/*', '.git' }
vim.opt.list = true
vim.opt.listchars = {
    eol = "↲",
    tab = '→ ',
    extends = "»",
    precedes = "«",
    trail = "⋅",
}
vim.opt.fillchars = {
    eob = " ",
}
vim.go.python3_host_prog = vim.fn.expand("/usr/bin/python3")
-- vim.go.node_host_prog = vim.fn.expand("~/.binaries/neovim-node/node_modules/.bin/neovim-node-host")
vim.cmd("let g:node_host_prog = '~/.binaries/neovim-node/node_modules/.bin/neovim-node-host'")
vim.cmd("let g:loaded_perl_provider = 0")
vim.cmd("let g:loaded_ruby_provider = 0")

-- set dark or light background theme
-- if (vim.env.NVIM_BACKGROUND == "light") then
--     vim.o.background = "light"
-- else
--     vim.o.background = "dark"
-- end
