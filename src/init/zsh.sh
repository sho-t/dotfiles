#!/bin/bash

declare -r ZPLUG="${HOME}/.zplug"
declare -r DIRCOLORS="${HOME}/.dircolors"
declare -r COMPLETION_PATH="${HOME}/.zsh/completions"

# --------------------------------------------------
# | zsh setup function
# --------------------------------------------------
 
install_zinit() {
  if [ ! -d ${ZPLUG} ] ; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"
  fi
}

install_dircolors() {
  if [ ! -r ${DIRCOLORS} ] ; then
    curl https://raw.githubusercontent.com/seebi/dircolors-solarized/master/dircolors.ansi-universal -o $DIRCOLORS
  fi
}

fetch_completions() {
  # docker
  curl -sL https://raw.githubusercontent.com/docker/cli/master/contrib/completion/zsh/_docker -o ${COMPLETION_PATH}/_docker
  # docker-compose
  curl -sL https://raw.githubusercontent.com/docker/compose/$(docker-compose version --short)/contrib/completion/zsh/_docker-compose > ${COMPLETION_PATH}/_docker-compose
  # hub
  curl -sL https://raw.githubusercontent.com/github/hub/master/etc/hub.zsh_completion -o ${COMPLETION_PATH}/_hub
}

main() {
  install_dircolors
  install_zinit
  fetch_completions
}

main "$@"
