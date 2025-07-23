-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Only highlight current line for active window.
-- see http://vim.wikia.com/wiki/Highlight_current_line

-- Windows autocmds
if vim.fn.has("win32") or vim.fn.has("win64") then
  require("windows.autocmds")
end

-- set cursorline when entering a buffer
local userAU_cursorline = vim.api.nvim_create_augroup("userUa_cursorLine", { clear = true })
vim.api.nvim_create_autocmd({ "VimEnter", "WinEnter", "BufWinEnter" }, {
  desc = "Only highlight current line for active window",
  group = userAU_cursorline,
  callback = function()
    vim.api.nvim_set_option_value("cursorline", true, { scope = "local" })
  end,
})
vim.api.nvim_create_autocmd("WinLeave", {
  desc = "Only highlight current line for active window",
  group = userAU_cursorline,
  callback = function()
    vim.api.nvim_set_option_value("cursorline", false, { scope = "local" })
  end,
})

-- set colorcolumn to {"80", "120"} for specific filetypes
local userAU_colorcolumn = vim.api.nvim_create_augroup("userAU_colorcolumn", { clear = true })
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
  desc = "Set colorcolumn to 80 and 120 on specific filetypes",
  pattern = { "*.lua", "*.py", "*.c", "*.h", "*.ino", "*.cpp", "*.js", "*.ts", "*.tsx", "*.jsx" },
  group = userAU_colorcolumn,
  callback = function()
    vim.api.nvim_set_option_value("colorcolumn", "80,120", { scope = "local" })
  end,
})

-- Set relativenumber when entering insert mode
-- from https://github.com/sitiom/nvim-numbertoggle
local augroup = vim.api.nvim_create_augroup("numbertoggle", {})
vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained", "InsertLeave", "CmdlineLeave", "WinEnter" }, {
  pattern = "*",
  group = augroup,
  callback = function()
    if vim.o.nu and vim.api.nvim_get_mode().mode ~= "i" then
      vim.opt.relativenumber = true
    end
  end,
})
vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost", "InsertEnter", "CmdlineEnter", "WinLeave" }, {
  pattern = "*",
  group = augroup,
  callback = function()
    if vim.o.nu then
      vim.opt.relativenumber = false
      vim.cmd("redraw")
    end
  end,
})

-- Disable auto comments when pressing o in normal mode
local userUA_fixcomment = vim.api.nvim_create_augroup("userUA_fixcomment", { clear = true })
vim.api.nvim_create_autocmd({ "InsertLeave" }, {
  desc = "disable auto comments when pressing o in normal mode",
  group = userUA_fixcomment,
  callback = function()
    vim.api.nvim_set_option_value("formatoptions", "jncrql", { scope = "local" })
  end,
})

local userUA_extra_conceal = vim.api.nvim_create_augroup("userUA_extra_conceal", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter" }, {
  group = userUA_extra_conceal,
  pattern = { "copilot-*" },
  callback = function()
    vim.opt_local.conceallevel = 0
  end,
})
