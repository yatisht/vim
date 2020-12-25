setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal textwidth=80
setlocal smarttab
setlocal expandtab

function! CComment()
    s!^!//!
endfunction

vnoremap <silent> <buffer> c :call CComment()<cr>
nnoremap <silent> <buffer> c :call CComment()<cr>
inoremap <silent> <buffer> <c-c> <esc>:call CComment()<cr>i

function! CUnComment()
    s!^\(\s*\)//!\1!
endfunction

vnoremap <silent> <buffer> C :call CUnComment()<cr>
nnoremap <silent> <buffer> C :call CUnComment()<cr>
inoremap <silent> <buffer> <c-d> <esc>:call CUnComment()<cr>

autocmd CursorMoved * exe printf('match TabLineSel /\V\<%s\>/', escape(expand('<cword>'), '/\'))
nnoremap <silent> t :TlistToggle<CR>
