-- spell in files
local spell_files = vim.api.nvim_create_augroup("spell_files", { clear = true })
vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = {
        "python",
        "jsonc",
        "markdown",
        "latex",
        "gitcommit",
    },
    desc = "Enable spell with selected files",
    group = spell_files,
    callback = function()
        vim.opt_local.spelllang = "en_us,es_es"
        vim.opt_local.spell = true
    end,
})

-- automatic conceal level
local conceal_ft = vim.api.nvim_create_augroup("conceal_ft", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "markdown", "latex", "typst" },
    desc = "'set conceallevel=2' for some filetypes",
    group = conceal_ft,
    callback = function()
        vim.opt_local.conceallevel = 2
    end,
})

-- Set colorcolumn
local col_col = vim.api.nvim_create_augroup("curcol", { clear = true })
vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = { "python", "typescript", "typescriptreact", "javascript", "javascriptreact" },
    desc = "Sets a color column in python or javascript files",
    group = col_col,
    callback = function()
        vim.opt_local.colorcolumn = "80"
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

-- Highlight Yanked Text
local h_yank = vim.api.nvim_create_augroup("hyank", { clear = true })
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
    desc = "Highlight yank text when 'yy' is pressed",
    group = h_yank,
    callback = function()
        vim.highlight.on_yank({ higroup = "Visual", timeout = 200 })
    end,
})

-- Only highlight current line for active window.
-- see http://vim.wikia.com/wiki/Highlight_current_line
vim.cmd([[
  augroup CursorLine
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
  augroup END
]])

-- TrimWhiteSpace function by the Primeagen
-- By the primeagen. https://www.youtube.com/watch?v=DogKdiRx7ls
vim.cmd([[
fun! TrimWhiteSpace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun
augroup THE_PRIMEAGEN_MODIFIED
    autocmd!
    autocmd BufWritePre * :call TrimWhiteSpace()
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

-- auto relative numbers
-- local auto_rel_numbers = vim.api.nvim_create_augroup("autonumbers", { clear = true })
-- -- vim.api.nvim_create_autocmd("InsertEnter", {
-- vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost", "InsertEnter", "CmdlineEnter", "WinLeave" }, {
--     desc = "set relative numbers in normal mode",
--     group = auto_rel_numbers,
--     callback = function()
--         vim.opt_local.relativenumber = false
--     end,
-- })

-- -- vim.api.nvim_create_autocmd({ "InsertLeave", "VimEnter", "BufWinEnter", "WinEnter" }, {
-- vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained", "InsertLeave", "CmdlineLeave", "WinEnter" }, {
--     desc = "set normal numbers in insert mode",
--     group = auto_rel_numbers,
--     callback = function()
--         vim.opt_local.relativenumber = true
--     end,
-- })

-- hide numbers in terminal buffer
local hide_term_numbers = vim.api.nvim_create_augroup("hide_tnumbers", { clear = true })
vim.api.nvim_create_autocmd({ "TermOpen", "TermEnter" }, {
    desc = "Hide relative numbers in terminal",
    pattern = { "*" },
    group = hide_term_numbers,
    command = "setlocal nonumber norelativenumber",
})

-- form devaslife
vim.api.nvim_create_autocmd("InsertLeave", {
    pattern = "*",
    command = "set nopaste",
})
