-- general options
local opt = vim.opt

opt.path:append({ "**" })
opt.wildignore:append({ "*/node_modules/*", "*.pyc", "*/__pycache__/*", ".git" })
opt.colorcolumn = { "80", "120" }
opt.relativenumber = false
opt.clipboard = "unnamed"

vim.g.autoformat = false
vim.g.snacks_animate = false

-- providers
-- vim.cmd("let g:python3_host_prog = '~/.virtualenvs/neovim/bin/python3'")
-- vim.cmd("let g:node_host_prog = '~/.binaries/neovim/node_modules/.bin/neovim-node-host'")
vim.cmd("let g:loaded_perl_provider = 0")
vim.cmd("let g:loaded_ruby_provider = 0")

-- theme
-- set dark or light background theme
if vim.env.NVIM_BACKGROUND == "light" then
  opt.background = "light"
else
  opt.background = "dark"
end

-- lazyvim
vim.g.lazyvim_python_lsp = "pyright"

vim.cmd([[
		let &shell = executable('pwsh') ? 'pwsh' : 'powershell'
		let &shellcmdflag = '-nol -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.UTF8Encoding]::new();$PSDefaultParameterValues[''Out-File:Encoding'']=''utf8'';Remove-Alias -Force -ErrorAction SilentlyContinue tee;'
		let &shellredir = '2>&1 | %%{ "$_" } | Out-File %s; exit $LastExitCode'
		let &shellpipe  = '2>&1 | %%{ "$_" } | tee %s; exit $LastExitCode'
		set shellquote= shellxquote=
]])
