set runtimepath+="~iwancof/nvim"

" source ~iwancof/.vim/dein.vim
" call dein#add("~iwancof/.vim/coc.nvim")

call plug#begin()
Plug 'evanleck/vim-svelte', {'branch': 'main'}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'cpiger/NeoDebug'
call plug#end()


" Editor Settings
set fenc=utf-8
set showcmd

set list listchars=tab:\>\_
" set expandtab
set tabstop=2
set shiftwidth=2

set ignorecase
set smartcase
set hlsearch

" Visual Settings
set relativenumber
set number

syntax on
set smartindent

" colorscheme
colorscheme molokai
set t_Co=256

noremap x "_x


