syntax on

set et
set ru
set nocompatible
filetype off

filetype plugin indent on

colorscheme elflord

set tabstop=16
set softtabstop=4

set backspace=eol,start,indent
set whichwrap+=<,>h,l

set number
ino jk <esc>

set mouse=a

" Explicitely highlights tabs
highlight SpecialKey ctermfg=1
set list
set listchars=tab:T>
" highlight trailing whitespace in yellow
highlight TrailingWhitespace ctermbg=yellow ctermfg=black
call matchadd('TrailingWhitespace', '\s\+$')

" highlight lines of more than 80 chars in red
highlight OverLength ctermbg=red ctermfg=white
call matchadd('OverLength', '\%81v.\+')

