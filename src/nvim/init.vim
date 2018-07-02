if &compatible
	set nocompatible
endif
set runtimepath+=~/.config/nvim/dein.vim/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.config/nvim/dein.vim')
	call dein#begin('~/.config/nvim/dein.vim')

	call dein#add('~/.config/nvim/dein.vim')

	call dein#end()
	call dein#save_state()
endif

filetype plugin indent on
syntax enable

" Indent
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

" 
syntax enable
filetype plugin indent on
set encoding=utf-8
set ruler
set number
set relativenumber
set numberwidth=4

set smartcase
set nowrapscan
set incsearch

set mouse=
