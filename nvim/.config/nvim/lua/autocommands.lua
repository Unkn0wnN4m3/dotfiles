-- Set wrap and spell in markdown and gitcommit
vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = { "gitcommit", "markdown", "python" },
    callback = function()
        vim.opt_local.wrap = true
        vim.opt_local.spell = true
        vim.opt_local.spelllang = "en_us"
    end,
})

-- Set colorcolumn
vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = { "python", "typescript", "typescriptreact", "javascript", "javascriptreact" },
    callback = function()
        vim.opt_local.colorcolumn = "80"
    end,
})

-- Fixes Autocomment
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
    callback = function()
        vim.cmd("set formatoptions-=cro")
    end,
})

-- Highlight Yanked Text
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
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

-- Remember last file edit position on open.
-- See http://askubuntu.com/questions/202075/how-do-i-get-vim-to-remember-the-line-i-was-on-when-i-reopen-a-file
vim.cmd([[
  if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
  endif
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
if vim.fn.has 'win32' == 1 then
    vim.api.nvim_create_autocmd("VimLeave", {
        callback = function()
            vim.opt.guicursor = "a:ver10-blinkon1"
        end
    })
end
