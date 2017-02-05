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
NeoBundle 'Shougo/vimshell.vim'
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
set t_Co=256
set background=light
colorscheme solarized

" Unite Setting---------------------------------
let g:unite_source_file_mru_filename_format=''
let g:unite_enable_start_insert=1

" buffer list
noremap <C-P> :Unite buffer<CR>
" file list
noremap <C-N> :Unite -buffer-name=file file<CR>
" file mru
noremap <C-Z> :Unite file_mru<CR>

" <Ctrl + J> = split
au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
" <Ctrl + K> = vsprit
au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
" <ESC> <ESC> = :q
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

" Vimfiler Setting------------------------------
let g:vimfiler_as_default_explorer=1
let g:vimfiler_safe_mode_by_default=0

" Open filer
noremap <silent> :tree :VimFiler -split -simple -winwidth=45 -no-quit
noremap <C-X><C-T> :VimFiler -split -simple -winwidth=45 -no-quit<ENTER>

" LightLine Setting-----------------------------

let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'filename'] ]
      \ },
      \ 'component_function': {
      \   'fugitive': "MyFugitive",
      \   'readonly': "MyReadonly",
      \   'modified': "MyModified",
      \   'filename': "MyFilename"
      \ },
      \ 'separator': { 'left': '⮀', 'right': '⮂' },
      \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
      \ }

function! MyModified()
    if &filetype == "help"
        return ""
    elseif &modified
        return "+"
    else
        return ""
    endif
endfunction

function! MyReadonly()
    if &filetype == "help"
        return ""
    elseif &readonly
        return "⭤"
    else
        return ""
    endif
endfunction

function! MyFugitive()
    if exists("*fugitive#head")
        let branch = fugitive#head()
        return branch !=# '' ? '⭠ '.branch : ''
    endif
    return ''
endfunction

function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
       \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
       \ ('' != MyModified() ? ' ' . MyModified() : '')
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
set clipboard+=unnamed

"Tab & Indent
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

" Input
set backspace=indent,eol,start
set formatoptions+=mM 
set autoindent
set smartindent
set imdisable

"Cursor
set whichwrap=b,s,h,l,<,>,[,],~
set number
set nowrap
set cursorline

"Code
set showmatch
set matchpairs& matchpairs+=<:> 
set smarttab

"System
set wildmenu
set wildmode=list:longest,full
set history=1000
set infercase
set virtualedit+=block  

"StatusLine
set laststatus=2
set showmode
set showcmd
set ruler

"Visualbell
set visualbell t_vb=
set noerrorbells

"Search
set ignorecase
set smartcase
set incsearch
set wrapscan
set hlsearch

"KeyMap Setting--------------------------
"Yank
noremap Y y$

"VisualMode indent
vnoremap < <gv
vnoremap > >gv

"It as Esc
inoremap jj <Esc>
inoremap <silent> っj <ESC>

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

"Leader
let mapleader = "\<Space>"

noremap <Leader>h ^
noremap <Leader>l $
noremap <Leader>w :w<CR>
noremap <Leader>q :q<CR>

"autocmd Settting
autocmd BufNewFile,BufRead *.rb nnoremap  :!ruby %
autocmd BufNewFile,BufRead *.py nnoremap  :!python %
