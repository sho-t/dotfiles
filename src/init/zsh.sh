#!/bin/bash

readonly ZINIT="${HOME}/.zinit"
readonly DIRCOLORS="${HOME}/.dircolors"
readonly COMPLETION_PATH="${HOME}/.zsh/completions"

readonly DOCKER_RESOURCE_PATH="/Applications/Docker.app/Contents/Resources/etc/"

# --------------------------------------------------
# | zsh setup function
# --------------------------------------------------
 
install_zinit() {
  if [ ! -d ${ZINIT} ] ; then
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
  ln -s ${DOCKER_RESOURCE_PATH}docker.zsh-completion ${COMPLETION_PATH}/_docker
  # docker-compose
  ln -s ${DOCKER_RESOURCE_PATH}docker-compose.zsh-completion ${COMPLETION_PATH}/_docker-compose
}

main() {
  install_dircolors
  install_zinit
  fetch_completions
}

main "$@"
