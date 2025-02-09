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
vim.cmd([[
  augroup CursorLine
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
  augroup END
]])

-- Reset to vertical cursor when leave nvim on windws
local reset_cursor = vim.api.nvim_create_augroup("resetcursor", { clear = true })
vim.api.nvim_create_autocmd("VimLeave", {
  desc = "Reset cursor from block to beam",
  group = reset_cursor,
  callback = function()
    vim.opt.guicursor = "a:ver10-blinkon1"
  end,
})

-- Fixes auto comment when <C-o>
local fix_comments = vim.api.nvim_create_augroup("fixcomments", { clear = true })
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
  desc = "If you are in a comment line, don't add new comment line after <C-o>",
  group = fix_comments,
  callback = function()
    vim.cmd("set formatoptions-=o")
  end,
})
