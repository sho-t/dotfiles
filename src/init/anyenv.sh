#!/bin/bash

# --------------------------------------------------
# | anyenv setup function
# --------------------------------------------------

init() {
  if [ ! -d ${HOME}/.anyenv ]; then
    anyenv install --init
  fi
}

install_anyenv_plugins() {
  mkdir -p $(anyenv root)/plugins
  git clone https://github.com/znz/anyenv-update.git $(anyenv root)/plugins/anyenv-update
  git clone https://github.com/znz/anyenv-git.git $(anyenv root)/plugins/anyenv-git
}

install_env() {
    anyenv install nodenv
    anyenv install rbenv
    anyenv install goenv
    exec $SHELL -l
}

main() {
  init
  install_anyenv_plugins
  install_env
}

main "$@"
