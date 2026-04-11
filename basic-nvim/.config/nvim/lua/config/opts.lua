vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local opt = vim.opt

opt.confirm = true
opt.pumblend = 10
opt.pumheight = 10
opt.scrolloff = 8
opt.sidescrolloff = 12
-- opt.shortmess:append({ W = true, I = true, c = true, C = true })
opt.spelllang = { "en", "es" }
