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
opt.winborder = "rounded"

-- Windows config
if vim.fn.has("win32") == 1 then
  require("windows.options")
end

-- neovide config
if vim.g.neovide then
  require("neovide.options")
end

-- wsl config
if vim.fn.has("wsl") == 1 then
  require("wsl.options")
end
