if &compatible 
  set nocompatible
endif

set runtimepath+=/home/proelbtn/.config/nvim/dein.vim/repos/github.com/Shougo/dein.vim

if dein#load_state('/home/proelbtn/.config/nvim/dein.vim')
  call dein#begin('/home/proelbtn/.config/nvim/dein.vim')

  call dein#add('/home/proelbtn/.config/nvim/dein.vim/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here like this:
  "call dein#add('Shougo/neosnippet.vim')
  "call dein#add('Shougo/neosnippet-snippets')
  
  call dein#add('Shougo/denite.nvim')

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable


set smartindent
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2


set ignorecase
set smartcase
set wrapscan
set incsearch
set inccommand=split

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
