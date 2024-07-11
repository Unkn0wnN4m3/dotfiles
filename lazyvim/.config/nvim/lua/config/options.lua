-- general options
local opt = vim.opt

opt.path:append({ "**" })
opt.wildignore:append({ "*/node_modules/*", "*.pyc", "*/__pycache__/*", ".git" })
opt.colorcolumn = { "80", "120" }
opt.relativenumber = false
opt.clipboard = "unnamed"

-- providers
vim.cmd("let g:python3_host_prog = '~/.virtualenvs/neovim/bin/python3'")
vim.cmd("let g:node_host_prog = '~/.binaries/neovim/node_modules/.bin/neovim-node-host'")
vim.cmd("let g:loaded_perl_provider = 0")
vim.cmd("let g:loaded_ruby_provider = 0")

-- theme
-- set dark or light background theme
if vim.env.NVIM_BACKGROUND == "light" then
  vim.o.background = "light"
else
  vim.o.background = "dark"
end
