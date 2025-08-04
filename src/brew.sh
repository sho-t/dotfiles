#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" && . "utils.sh"

declare -r DOTPATH="${HOME}/dotfiles"

# --------------------------------------------------
# | Homebrew formula function
# --------------------------------------------------

initialize() {
  if has "brew"; then
    p_info "Already installed Homebrew ✔︎"
  else
    p_start "Installing Homebrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" > /dev/null
  fi

  if has "brew"; then
    p_start "Updating Homebrew..."
    brew update > /dev/null && brew upgrade > /dev/null
    [[ $? ]] && p_success "Homebrew initialized" 
  else
    p_error "failed Hombrew install"; exit 1
  fi
}

install() {
  cd $DOTPATH
  brew tap Homebrew/bundle
  brew bundle --no-lock
}

main() {
  p_start "Setup Homebrew"
  initialize && install && p_success "Completed the Setup Homebrew"
}

main "$@"
