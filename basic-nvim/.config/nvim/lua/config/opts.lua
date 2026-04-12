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
opt.wildmode = "longest:full,full"
opt.wrap = false
opt.virtualedit = "block"
opt.updatetime = 200
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

