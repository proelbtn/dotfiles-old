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

  call dein#add('wsdjeg/dein-ui.vim')

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable


set expandtab
set tabstop=2
set shiftwidth=2
