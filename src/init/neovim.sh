#!/bin/bash

declare -r DOTPATH="${HOME}/dotfiles"

# --------------------------------------------------
# | neovim setup function
# --------------------------------------------------

cd $DOTPATH
git submodule foreach git pull origin master
pip3 install pynvim
nvim :UpdateRemotePlugins
