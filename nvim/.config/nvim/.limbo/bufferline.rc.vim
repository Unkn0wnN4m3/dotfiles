let g:lightline#bufferline#unnamed = '[No Name]'
let g:lightline#bufferline#modified = " "
let g:lightline#bufferline#read_only = ""
let g:lightline#bufferline#number_separator = " | "
let g:lightline#bufferline#show_number = 2
let g:lightline#bufferline#enable_devicons = 1
let g:lightline#bufferline#clickable = 1

autocmd BufWritePost,TextChanged,TextChangedI * call lightline#update()
