syntax on

set nocompatible
filetype off

filetype plugin indent on

colorscheme elflord

set tabstop=4

set backspace=eol,start,indent
set whichwrap+=<,>h,l

set number
ino jj <esc>

set mouse=a

" Explicitely highlights tabs
highlight SpecialKey ctermfg=1
set list
set listchars=tab:T>

" highlight lines of more than 80 chars in red
highlight Overlength ctermbg=red ctermfg=white
match Overlength /\%80v.\+/

highlight TrailingWhitespace ctermbg=yellow ctermfg=white
match TrailingWhitespace /\s\+$/

