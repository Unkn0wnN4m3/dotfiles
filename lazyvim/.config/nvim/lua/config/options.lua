-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- lazyvim
vim.g.autoformat = false
vim.g.snacks_animate = false

-- providers
vim.g.loaded_node_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0

-- general options
local opt = vim.opt

opt.path:append({ "**" })
opt.wildignore:append({ "*/node_modules/*", "*.pyc", "*/__pycache__/*", ".git", "*/.ruff_cache/*" })
opt.relativenumber = false
opt.spelllang = { "en", "es" }
opt.background = vim.env.NVIM_BACKGROUND == "light" and "light" or "dark"

-- windows config
if vim.fn.has("win32") or vim.fn.has("win64") then
  -- providers
  vim.g.python3_host_prog = vim.env.HOME .. "/.virtualenvs/nvim_provider/Scripts/python.exe"

  -- terminal
  vim.cmd([[
		let &shell = executable('pwsh') ? 'pwsh' : 'powershell'
		let &shellcmdflag = '-nol -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.UTF8Encoding]::new();$PSDefaultParameterValues[''Out-File:Encoding'']=''utf8'';Remove-Alias -Force -ErrorAction SilentlyContinue tee;'
		let &shellredir = '2>&1 | %%{ "$_" } | Out-File %s; exit $LastExitCode'
		let &shellpipe  = '2>&1 | %%{ "$_" } | tee %s; exit $LastExitCode'
		set shellquote= shellxquote=
  ]])
else
  vim.g.python3_host_prog = vim.env.HOME .. "/.virtualenvs/nvim_provider/bin/python3"
end

-- neovide config
if vim.g.neovide then
  vim.o.guifont = "Maple Mono NF,JetBrainsMono Nerd Font Mono:h12:h12"
  -- vim.g.neovide_transparency = 0.9
  -- vim.g.neovide_normal_opacity = 0.95
  vim.g.neovide_window_blurred = true
  vim.g.neovide_remember_window_size = false
  vim.g.neovide_hide_mouse_when_typing = true
  vim.g.neovide_cursor_vfx_mode = "sonicboom"
  vim.g.neovide_title_background_color =
    string.format("%x", vim.api.nvim_get_hl(0, { id = vim.api.nvim_get_hl_id_by_name("Normal") }).bg)
  vim.g.neovide_title_text_color = "#FF69B4"
end
