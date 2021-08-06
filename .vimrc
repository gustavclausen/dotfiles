set nobackup
set noswapfile
set noerrorbells

set mouse=a
set ttymouse=xterm2
set wildmenu

set clipboard=unnamedplus
if has('mac')
    set clipboard=unnamed
endif

" Appearance "
syntax on
colorscheme molokai
set number
set relativenumber
set showcmd
set nu rnu
set laststatus=2

" Search "
set hlsearch
set ignorecase
set incsearch

" Indents/tabs "
set autoindent
set smartindent
set expandtab     " On pressing tab, insert 2 spaces
set tabstop=2     " Show existing tab with 2 spaces width
set softtabstop=2
set shiftwidth=2  " When indenting with '>', use 2 spaces width

" Plugins "
so ~/.vim/plugins.vim

" Bindings "
nnoremap <C-@> :noh<CR>
