#!/bin/bash

declare -r ZPLUG="${HOME}/.zplug"
declare -r DIRCOLORS="${HOME}/.dircolors"

# --------------------------------------------------
# | zsh setup function
# --------------------------------------------------
 
install_zplug() {
  if [ ! -d ${ZPLUG} ] ; then
    curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh| zsh
  fi
}

install_dircolors() {
  if [ ! -r ${DIRCOLORS} ] ; then
    curl -o https://raw.githubusercontent.com/seebi/dircolors-solarized/master/dircolors.ansi-universal ~/.dircolors
  fi
}

main() {
  install_dircolors
  install_zplug
}

main "$@"
