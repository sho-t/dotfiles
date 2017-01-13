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
NeoBundle 'Shougo/vimfiler'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'Yggdroot/indentLine'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'Townk/vim-autoclose'

" ColorScheme here
NeoBundle 'altercation/vim-colors-solarized' 
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'tomasr/molokai'
NeoBundle 'sjl/badwolf'

call neobundle#end()

" Required:
filetype plugin indent on

NeoBundleCheck

" ColorScheme Setting--------------------------
syntax enable
set background=light
colorscheme solarized

" LightLine Setting-----------------------------
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitve', 'filename'] ]
      \ },
      \ 'component_function': {
      \   'fugitive': "LightLineFugitive",
      \   'readonly': "LightLinwReadonly",
      \   'modified': "LightLineModified",
      \   'filename': "LightLineFilename"
      \ },
      \ 'separator': { 'left': '⮀', 'right': '⮂' },
      \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
      \ }

function! LightLineModified()
    if &filetye == "help"
        return ""
    elseif &modified
        return "+"
    else
        return ""
    endif
endfunction

function! LightlineReadonly()
    if &filetype == "help"
        return ""
    elseif &readonly
        return "⭤"
    else
        return ""
    endif
endfunction

function! LightlineFugitive()
  if &ft !~? 'vimfiler\|gundo' && exists("*fugitive#head")
    let branch = fugitive#head()
    return branch !=# '' ? '⭠ '.branch : ''
  endif
  return ''
endfunction

function! LightlineFilename()
  return ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
       \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
       \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
endfunction

" End Script-----------------------------------

"Font
set guifont=Ricty\ for\ Powerline:h15

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
set noswapfile

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
set wrap
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

"Visualbell
set visualbell t_vb=
set noerrorbells

"KeyMap Setting--------------------------
"It as Esc
inoremap jj <Esc>

"Off the highlight
nmap <silent> <Esc><Esc> :nohlsearch<CR>

"Bring the search word to the center of the screen
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

"Move with wrapped text
nnoremap j gj
nnoremap k gk

"Increment & Decrement
nnoremap + <C-a>
nnoremap - <C-x>

"Select until the end of the line
vnoremap v $h
