" LIGHTLINE Configuration
"
let g:lightline = {
    \ 'colorscheme': 'solarized',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'readonly' ],
    \             [ 'fugitive', 'filename' ] ],
    \   'right': [ [ 'lineinfo' ],
    \              [ 'percent' ],
    \              [ 'cocstatus', 'indent', 'fileencoding', 'filetype' ] ]
    \ },
    \ 'inactive': {
    \   'left': [ ['filename'] ],
    \   'right': [ ['percent'] ]
    \ },
    \ 'component_function': {
    \   'fugitive': 'LightlineFugitive',
    \   'filetype': 'MyFiletype',
    \   'fileformat': 'MyFileformat',
    \   'filename': 'LightlineFilename',
    \   'readonly': 'LightlineReadonly',
    \   'cocstatus': 'StatusDiagnostig',
    \   'indent': 'LightlineIndent'
    \ },
    \ 'tabline': {
    \   'left': [ ['buffers'] ],
    \   'right': [ ['close'] ]
    \ },
    \ 'component_expand': {
    \   'buffers': 'lightline#bufferline#buffers'
    \ },
    \ 'component_type': {
    \   'buffers': 'tabsel'
    \ },
    \ 'component_raw': {'buffers': 1},
    \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
    \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" },
    \ }

" " Use autocmd to force lightline update.
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? WebDevIconsGetFileTypeSymbol() . ' ' . &filetype : '[!] no ft') : ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? (WebDevIconsGetFileFormatSymbol() . ' ' . &fileformat) : ''
endfunction

function! LightlineIndent() abort
  return (&expandtab ? "Spaces" : "Tab size") . ':' . (&expandtab ? &shiftwidth : &tabstop)
endfunction

function! LightlineModified()
    return &ft =~# 'help\|vimfiler' ? '' : &modified ? '' : &modifiable ? '' : ''
endfunction

function! LightlineReadonly()
    return &ft !~? 'help\|vimfiler' && &readonly ? '' : ''
endfunction

function! LightlineFilename()
    return (&ft ==# 'vimfiler' ? vimfiler#get_status_string() :
    \  &ft ==# 'unite' ? unite#get_status_string() :
    \ expand('%') !=# '' ? expand('%') : '[No Name]') .
    \ (LightlineModified() !=# '' ? ' ' . LightlineModified() : '')
endfunction

function! LightlineFugitive()
  try
    if expand('%:t') !~? 'Tagbar\|Gundo\|NERD' && &ft !~? 'vimfiler' && exists('*FugitiveHead')
      let mark = ' '  " edit here for cool mark
      let branch = FugitiveHead()
      return branch !=# '' ? mark.branch : ''
    endif
  catch
  endtry
  return ''
endfunction

function! StatusDiagnostig() abort
  let info = get(b:, 'coc_diagnostic_info', {})
  if empty(info) | return '' | endif
  let msgs = []
  if get(info, 'error', 0)
    call add(msgs, ':' . info['error'])
  endif
  if get(info, 'warning', 0)
    call add(msgs, ':' . info['warning'])
  endif
  return join(msgs, ' ') . ' ' . get(g:, 'coc_status', '')
endfunction
