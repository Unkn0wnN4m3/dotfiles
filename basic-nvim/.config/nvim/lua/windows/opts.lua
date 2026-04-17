-- providers
vim.g.python3_host_prog = vim.env.HOME
    .. "\\.virtualenvs\\nvim_provider\\Scripts\\python.exe"

vim.cmd([[
set noshelltemp
let &shell = 'pwsh'
let &shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command '
let &shellcmdflag .= '[Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.UTF8Encoding]::new();'
let &shellcmdflag .= '$PSDefaultParameterValues[''Out-File:Encoding'']=''utf8'';'
let &shellcmdflag .= '$PSStyle.OutputRendering = ''PlainText'';'
let &shellpipe  = '> %s 2>&1'
let $__SuppressAnsiEscapeSequences = 1
set shellquote= shellxquote=
]])
