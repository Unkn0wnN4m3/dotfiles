-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- providers
vim.cmd("let g:loaded_python3_provider = 0")
vim.cmd("let g:loaded_node_provider = 0")
vim.cmd("let g:loaded_perl_provider = 0")
vim.cmd("let g:loaded_ruby_provider = 0")

-- general options
local opt = vim.opt

opt.path:append({ "**" })
opt.wildignore:append({ "*/node_modules/*", "*.pyc", "*/__pycache__/*", ".git" })
opt.colorcolumn = { "80", "120" }
opt.relativenumber = false
opt.clipboard = "unnamed"

-- lazyvim
vim.g.autoformat = false
vim.g.snacks_animate = false

-- theme
-- set dark or light background theme
if vim.env.NVIM_BACKGROUND == "light" then
  opt.background = "light"
else
  opt.background = "dark"
end

-- terminal
if vim.fn.has("win32") or vim.fn.has("win64") then
  vim.cmd([[
		let &shell = executable('pwsh') ? 'pwsh' : 'powershell'
		let &shellcmdflag = '-nol -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.UTF8Encoding]::new();$PSDefaultParameterValues[''Out-File:Encoding'']=''utf8'';Remove-Alias -Force -ErrorAction SilentlyContinue tee;'
		let &shellredir = '2>&1 | %%{ "$_" } | Out-File %s; exit $LastExitCode'
		let &shellpipe  = '2>&1 | %%{ "$_" } | tee %s; exit $LastExitCode'
		set shellquote= shellxquote=
  ]])
end

if vim.g.neovide then
  vim.o.guifont = "Maple Mono NF,JetBrainsMono Nerd Font Mono:h12:h12"
  vim.g.neovide_transparency = 1.0
  vim.g.neovide_normal_opacity = 1.0
  vim.g.neovide_window_blurred = true
  vim.g.neovide_remember_window_size = false
  vim.g.neovide_hide_mouse_when_typing = true
  vim.g.neovide_cursor_vfx_mode = "sonicboom"
end
