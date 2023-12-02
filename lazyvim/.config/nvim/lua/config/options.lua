-- general options
local opt = vim.opt

opt.path:append({ "**" })
vim.opt.wildignore:append({ "*/node_modules/*", "*.pyc", "*/__pycache__/*", ".git" })
opt.colorcolumn = "80"
opt.relativenumber = false
opt.clipboard = "unnamed"

-- providers
vim.cmd("let g:python3_host_prog = '~/.virtualenvs/provider-python/bin/python3'")
vim.cmd("let g:node_host_prog = '~/.binaries/provider-node/node_modules/.bin/neovim-node-host'")
vim.cmd("let g:loaded_perl_provider = 0")
vim.cmd("let g:loaded_ruby_provider = 0")
