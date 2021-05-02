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

" Plugin settings "
let NERDTreeShowHidden = 1
" Start NERDTree and put the cursor back in the other window
autocmd VimEnter * NERDTree | wincmd p
" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" Bindings "
nnoremap <C-n> :NERDTreeFocus<CR>
nnoremap <C-o> :NERDTreeToggle<CR>
nnoremap <C-@> :noh<CR>
