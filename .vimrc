"NeoBundle Scripts-----------------------------
if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif
  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'Yggdroot/indentLine'

call neobundle#end()

" Required:
filetype plugin indent on

NeoBundleCheck

" LightLine Script-----------------------------
let g:lightline = {
      \ 'colorscheme': 'wombat'
      \ }

"Encode
set encoding=utf-8
scriptencoding utf-8
set fileencoding=utf-8
set termencoding=utf-8
set ambiwidth=double

"File
set hidden
set autoread
set nobackup
set noundofile

"Windoows
set clipboard=unnamed

"Tab & Indent
set expandtab
set tabstop=4
set softtabstop=4
set autoindent
set smartindent
set shiftwidth=4

"Cursor
set whichwrap=b,s,h,l,<,>,[,],~
set number
set cursorline

"Code
set showmatch
set smarttab

"Command
set wildmenu
set history=5000

"StatusLine
set laststatus=2
set showmode
set showcmd
set ruler
