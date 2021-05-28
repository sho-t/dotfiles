" === deim.vim settings {{{
"
" https://github.com/Shougo/dein.vim
"
" Directory:
"   dein root: $XDG_CACHE_HOME/dein
"   dein repo: $XDG_CACHE_HOME/dein/repos/github.com/Shougo/dein.vim
" Plugin List:
"   default : $XDG_CONFIG_HOME/nvim/vimrc.d/dein/plugins.toml
"   lazy    : $XDG_CONFIG_HOME/nvim/vimrc.d/dein/plugins-lazy.toml
" Plugin Detail Settings:
"   $XDG_CONFIG_HOME/nvim/vimrc.d/plugins/*
"
" ======================================================================== }}}

if &compatible
  set nocompatible
endif

augroup Plugin_Hook
  autocmd!
augroup END

let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
let s:config_home = empty($XDG_CONFIG_HOME) ? expand('~/.config') : $XDG_CONFIG_HOME

let s:dein_path = s:cache_home . '/dein'
let s:dein_repo_path = s:dein_path . '/repos/github.com/Shougo/dein.vim'
let s:toml_path = s:config_home . '/nvim/vimrc.d/dein'

if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_path)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_path
  endif
  execute 'set runtimepath^=' . s:dein_repo_path
endif

" === Load Dein
if dein#load_state(s:dein_path)
  call dein#begin(s:dein_path)
  call dein#load_toml(s:toml_path . '/plugins.toml', {'lazy': 0})
  call dein#load_toml(s:toml_path . '/plugins-lazy.toml', {'lazy': 1})
  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

if has('vim_starting') && dein#check_install()
    call dein#install()
endif

" === Variable
let g:dein#enable_notification = 1
let g:dein#install_max_processes = 16
let g:dein#install_github_api_token = $GITHUB_API_TOKEN

" === Command
command! -nargs=0 DeinInstall :call s:deinInstall()
command! -nargs=0 DeinUpdateSelf :call dein#update('dein.vim')
command! -nargs=0 DeinUpdate :call dein#check_update(v:true)
command! -nargs=0 DeinClean :call s:deinClean()

function! s:deinInstall()
  if dein#check_install()
    call dein#install()
  else
    echo '[ERR] already installed.'
  endif
endfunction

function! s:deinClean()
  if len(dein#check_clean())
    call map(dein#check_clean(), 'delete(v:val, "rf")')
    call dein#recache_runtimepath()
  else
    echo '[ERR] no disabled plugins'
  endif
endfunction
