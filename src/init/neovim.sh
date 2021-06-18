#!/bin/bash

declare -r CACHE="${HOME}/.cahche"

# --------------------------------------------------
# | neovim setup function
# --------------------------------------------------

#pip3 install pynvim

# install dein.vim 
mkdir $HOME/.cache/dein
bash -c "$(curl -fsSL https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh)" _ ~/.cache/dein

# install plugins
nvim -es -u ~/.config/nvim/init.vim -i NONE \
-c "try | call dein#install() | finally | qall! | endtry" -V1
