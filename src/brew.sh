#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" && . "utils.sh"

declare -r DOTPATH="${HOME}/dotfiles"

# --------------------------------------------------
# | Homebrew formula function
# --------------------------------------------------

initialize() {
  if has "brew"; then
    echo "$(tput setaf 2)Already installed Homebrew ✔︎$(tput sgr0)"
  else
    p_start "Installing Homebrew"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi

  if has "brew"; then
    p_start "Updating Homebrew"
    brew update && brew upgrade
    [[ $? ]] && p_success "Homebrew initialized" 
  fi
}

install() {
  cd $DOTPATH
  brew tap Homebrew/bundle
  brew bundle
}

main() {
  p_start "Setup Homebrew"
  initialize && install && p_success "Homebrew setup complete"
}

main "$@"
