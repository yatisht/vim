syntax on
set cindent
set smartindent
set autoindent
set expandtab
set tabstop=4
set shiftwidth=4
set cinkeys=0{,0},0),:,0#,!^F,o,O,e
set nocp
map <C-L> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR>
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
fun! ShowFuncName()
    let lnum = line(".")
    let col = col(".")
    echohl ModeMsg
    echo getline(search("^[^ \t#/]\\{2}.*[^:]\s*$", 'bW'))
    echohl None
    call search("\\%" . lnum . "l" . "\\%" . col . "c")
endfun
map f :call ShowFuncName() <CR>
set wildmenu
set wildmode=list:longest
let g:tex_flavor = "latex"
set cursorline
highlight Cursorline cterm=bold
set tags=./tags;/
nnoremap <C-\> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

filetype plugin on
filetype plugin indent on
augroup filetype
    au! BufRead,BufNewFile *.ll     set filetype=llvm
    au! BufRead,BufNewFile *.ckt*   set filetype=spice
    au! BufRead,BufNewFile *.sp     set filetype=spice
    au! BufRead,BufNewFile *.lib    set filetype=spice
    au! BufRead,BufNewFile *.pm     set filetype=spice
    au! BufRead,BufNewFile *.cu     set filetype=cpp
augroup END

set statusline=%<[%{winnr()}]\ %f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
set laststatus=2

imap <tab><tab> <c-n>
map <A-Right> <c-]>
map <A-Left> <c-T>


