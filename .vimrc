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
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/vimshell.vim'
NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }
NeoBundle 'thinca/vim-quickrun'
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
"unite prefix key.
nnoremap [unite] <Nop>
nmap <Space>u [unite]

let g:unite_source_file_mru_filename_format=''
let g:unite_enable_start_insert=0

let g:unite_source_bookmark_directory = $HOME . '/.unite/bookmark'
 
" Grepping using <space>/
nnoremap <silent> [unite]/ :<C-u>Unite -no-quit -buffer-name=search grep:.<cr>
" filelist
nnoremap <silent> [unite]f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" bufferlist
nnoremap <silent> [unite]b :<C-u>Unite buffer<CR>
" registerlist
nnoremap <silent> [unite]r :<C-u>Unite -buffer-name=register register<CR>
" mrulist
nnoremap <silent> [unite]m :<C-u>Unite file_mru<CR>
" dirmrulist
nnoremap <silent> [unite]d :<C-u>Unite directory_mru<CR>
" yankhistory
nnoremap <silent> [unite]y :<C-u>Unite history/yank<CR>
" bookmarklist
nnoremap <silent> [unite]c :<C-u>Unite bookmark<CR>
" add bookmark
nnoremap <silent> [unite]a :<C-u>UniteBookmarkAdd<CR>

augroup vimrc
  autocmd FileType unite call s:unite_my_settings()
augroup END
function! s:unite_my_settings()
  nmap <buffer> <ESC> <Plug>(unite_exit)
  imap <buffer> jj <Plug>(unite_insert_leave)
  imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
  "split
  nnoremap <silent><buffer><expr> s unite#smart_map('s', unite#do_action('split'))
  inoremap <silent><buffer><expr> s unite#smart_map('s', unite#do_action('split'))
  "vsplit
  nnoremap <silent><buffer><expr> v unite#smart_map('v', unite#do_action('vsplit'))
  inoremap <silent><buffer><expr> v unite#smart_map('v', unite#do_action('vsplit'))
  "vimfiler
  nnoremap <silent><buffer><expr> f unite#smart_map('f', unite#do_action('vimfiler'))
  inoremap <silent><buffer><expr> f unite#smart_map('f', unite#do_action('vimfiler'))
endfunction

" Vimfiler Setting------------------------------
let g:vimfiler_as_default_explorer=1
let g:vimfiler_safe_mode_by_default=0

nnoremap <silent> <Space>fe :<C-u>VimFilerBufferDir -quit<CR>
nnoremap <silent> <Space>fi :<C-u>VimFilerBufferDir -split -simple -winwidth=35 -no-quit<CR>
 
" vimfiler keymap
augroup vimrc
  autocmd FileType vimfiler call s:vimfiler_my_settings()
augroup END
function! s:vimfiler_my_settings()
  nmap <buffer> q <Plug>(vimfiler_exit)
  nmap <buffer> Q <Plug>(vimfiler_hide)
endfunction

" Vimproc Setting------------------------------
let g:quickrun_config = get(g:, 'quickrun_config', {})
let g:quickrun_config._ = {
      \ 'runner'    : 'vimproc',
      \ 'runner/vimproc/updatetime' : 60,
      \ 'outputter' : 'error',
      \ 'outputter/error/success' : 'buffer',
      \ 'outputter/error/error'   : 'quickfix',
      \ 'outputter/buffer/split'  : ':rightbelow 8sp',
      \ 'outputter/buffer/close_on_empty' : 1,
      \ }

au FileType qf nnoremap <silent><buffer>q :quit<CR>

let g:quickrun_no_default_key_mappings = 1
nnoremap \r :write<CR>:QuickRun -mode n<CR>        
xnoremap \r :<C-U>write<CR>gv:QuickRun -mode v<CR> 
nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"

" VimShell Setting------------------------------
nnoremap <silent> ,is :VimShell<CR>
nnoremap <silent> ,ipy :VimShellInteractive python<CR>
nnoremap <silent> ,irb :VimShellInteractive irb<CR>
vnoremap <silent> ,ss :VimShellSendString<CR>
nnoremap <silent> ,ss <S-v>:VimShellSendString<CR>

" Neocomplete Setting---------------------------
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#disable_auto_complete = 1
let g:neocomplete#enable_auto_select = 1
inoremap <expr><C-Space> pumvisible() ? "\<down>" : neocomplete#start_manual_complete()

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

" Delete option 
nnoremap dh d0
nnoremap dl d$
noremap PP "0p
noremap x "_x

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

"Space
noremap <Space>h ^
noremap <Space>l $
noremap <Space>w :w<CR>
noremap <Space>q :q<CR>
