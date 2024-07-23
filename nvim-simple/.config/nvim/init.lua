require("config.opts")
require("config.binds")
require("config.autocommands")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", {
	ui = {
		border = "rounded",
		title = "Lazy",
	},
	install = {
		colorscheme = { "catppuccin", "habamax" },
	},
	defaults = {
		lazy = false,
		version = false, -- try installing the latest stable version for plugins that support semver
	},
})

-- set dark or light background theme
if vim.env.NVIM_BACKGROUND == "light" then
	vim.o.background = "light"
else
	vim.o.background = "dark"
end

-- choose theme
local theme = vim.env.NVIM_THEME
local status, _ = pcall(require, theme)

if not status then
	vim.cmd.colorscheme("catppuccin")
else
	vim.cmd.colorscheme(theme)
end
