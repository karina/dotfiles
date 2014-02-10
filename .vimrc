execute pathogen#infect()
filetype plugin indent on

set laststatus=2

set nocompatible
set number
set tabstop=2
set shiftwidth=2
set expandtab
set backspace=2
syntax on
set pastetoggle=<F2>
set smartindent
set incsearch
set ignorecase
set autoindent
set mouse=a
imap jj <Esc>
filetype indent on
imap <C-w><C-w> <Esc><C-w><C-w>
:colorscheme ir_black
cmap w!! w !sudo tee >/dev/null %
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%100v.\+/
