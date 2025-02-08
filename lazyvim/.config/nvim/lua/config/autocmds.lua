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

-- winbar hide
-- thanks https://github.com/fgheng/winbar.nvim/blob/main/lua/winbar/winbar.lua#L88
-- local hide_winbar = vim.api.nvim_create_augroup("hidewinbar", { clear = true })
-- vim.api.nvim_create_autocmd({ "BufReadPre" }, {
--   desc = "auto hide winbar",
--   group = hide_winbar,
--   callback = function()
--     local file_icon
--     local winbar_value
--     local status, _ = pcall(require, "nvim-web-devicons")
--     local filename = vim.fn.expand("%:t")
--     local filetype = vim.fn.expand("%:e")
--     local exclude = require("utils").exclude_filetype
--
--     if not status then
--       file_icon, _ = "", ""
--     else
--       file_icon, _ = require("nvim-web-devicons").get_icon(filename, filetype, { default = true })
--     end
--
--     if not file_icon then
--       file_icon = ""
--     end
--
--     if vim.tbl_contains(exclude, vim.bo.filetype) then
--       vim.opt_local.winbar = nil
--     else
--       winbar_value = "%=" .. file_icon .. " %f%m"
--       vim.opt_local.winbar = winbar_value
--     end
--   end,
-- })
