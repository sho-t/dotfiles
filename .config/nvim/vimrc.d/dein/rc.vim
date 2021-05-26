" ======================
" dein.vim Setting 
" ======================

if &compatible
  set nocompatible
endif

let s:dein_path = expand('~/.cache/dein')
let s:dein_repo_path = s:dein_path . '/repos/github.com/Shougo/dein.vim'
let s:toml_path = expand('~/.config/nvim/vimrc.d/dein')

if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_path)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_path
  endif
  execute 'set runtimepath^=' . s:dein_repo_path
endif

let g:dein#enable_notification = 1

if !dein#load_state(s:dein_path)
    finish
endif

call dein#begin(s:dein_path)
call dein#load_toml(s:toml_path . '/plugins.toml', {'lazy': 0})
call dein#load_toml(s:toml_path . '/plugins-lazy.toml', {'lazy': 1})
call dein#end()
call dein#save_state()

filetype plugin indent on
syntax enable

if dein#check_install()
  call dein#install()
endif
