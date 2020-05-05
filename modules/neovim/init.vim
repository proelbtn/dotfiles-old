" ==============================================================================

set runtimepath+=~/.config/nvim/dein.vim/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.config/nvim/dein.vim')
  call dein#begin('~/.config/nvim/dein.vim')

  call dein#add('~/.config/nvim/dein.vim/repos/github.com/Shougo/dein.vim')

  call dein#add('Shougo/denite.nvim')
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('deoplete-plugins/deoplete-jedi')
  call dein#add('deoplete-plugins/deoplete-go', {'build': 'make'})
  call dein#add('google/vim-jsonnet')

  call dein#end()
  call dein#save_state()
endif

" ==============================================================================

filetype plugin indent on
syntax enable

set number

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
nnoremap <C-s><C-s> :Denite file/rec<CR>
nnoremap <C-s><C-h> :vsplit<CR>
nnoremap <C-s><C-j> :split<CR> <C-w><C-j>
nnoremap <C-s><C-k> :split<CR>
nnoremap <C-s><C-l> :vsplit<CR> <C-w><C-l>

nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" ==============================================================================

augroup AutoSaveView
  autocmd!
  autocmd BufWritePost * mkview
  autocmd BufReadPost * silent! loadview
  if expand("%") =~# ".*/\.git/.*"
    autocmd! BufReadPost,BufWritePost *
  endif
augroup END

" ==============================================================================

let g:auto_save = 1

let g:deoplete#enable_at_startup = 1

let g:racer_cmd = '/home/proelbtn/.cargo/bin/racer'
let g:racer_experimental_completer = 1
