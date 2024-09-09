set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
" To install: vim, :PluginInstall
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/vundle'

" Other github packages for Vundle to handle
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/syntastic.git'
Plugin 'nanotech/jellybeans.vim'
Plugin 'tpope/vim-fugitive.git'
Plugin 'tpope/vim-commentary.git'
Plugin 'kien/ctrlp.vim'

let g:syntastic_python_flake8_args='--ignore=E501'

" All of your Plugins must be added before the following line
call vundle#end()            " required
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
