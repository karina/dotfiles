set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
" To install: vim, :BundleInstall
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle, required
Bundle 'gmarik/vundle'

" Other github packages for Vundle to handle
Bundle 'airblade/vim-gitgutter'
Bundle 'scrooloose/syntastic.git'
Bundle 'nanotech/jellybeans.vim'
Bundle 'tpope/vim-fugitive.git'
Bundle 'tpope/vim-commentary.git'
Bundle 'kien/ctrlp.vim'
Bundle 'digitaltoad/vim-jade'
Bundle 'kchmck/vim-coffee-script'

let g:syntastic_python_flake8_args='--ignore=E501'

filetype plugin indent on 

set number
set tabstop=4
set shiftwidth=4
set expandtab
set backspace=2
syntax on
set pastetoggle=<F2>
set smartindent
set incsearch
set ignorecase
set autoindent
set mouse=a
filetype indent on


" Lets map things
imap jj <Esc>
imap <C-w><C-w> <Esc><C-w><C-w>
let g:ctrlp_map = '<c-p>'

" Colors
colorscheme jellybeans 
set t_Co=256

""highlight current line
set cursorline "cursorcolumn

""highlight whitespace
highlight ErrorMsg ctermbg=red ctermfg=white guibg=#592929
match ErrorMsg '\s\+$'

cmap w!! w !sudo tee >/dev/null %
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%100v.\+/
