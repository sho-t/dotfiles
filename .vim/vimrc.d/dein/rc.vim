" dein.vim Setting 

if &compatible
  set nocompatible
endif

augroup plugin_hook
  autocmd!
augroup END

let s:dein_path = expand('~/.vim/dein')
let s:dein_repo_path = s:dein_path . '/repos/github.com/Shougo/dein.vim'
let s:dein_rc_path = '~/.vim/vimrc.d/plugins'

execute 'set runtimepath^=' . s:dein_repo_path
let g:dein#enable_notification = 1

if empty(glob(s:dein_repo_path.'/README.md'))
   echo 'dein.vim not installed!!(run :DotfilesSubmoduleUpdate)'
   function! DotfilesSubmoduleUpdate()
       cd ~/.dotfiles
       !git submodule init
       !git submodule update
       q
   endfunction
   command DotfilesSubmoduleUpdate :call DotfilesSubmoduleUpdate()
   finish
endif

call dein#begin(s:dein_path)
call dein#load_toml('~/.vim/vimrc.d/dein/plugins.toml', {'lazy': 0})
call dein#load_toml('~/.vim/vimrc.d/dein/plugins-lazy.toml', {'lazy': 1})
call dein#end()

if dein#check_install()
  call dein#install()
endif

function! s:deinClean()
  if len(dein#check_clean())
    call map(dein#check_clean(), 'delete(v:val, "rf")')
  else
    echo '[ERR] no disabled plugins'
  endif
endfunction
command! DeinClean :call s:deinClean()
