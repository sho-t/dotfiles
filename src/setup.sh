#!/bin/bash

set -u

declare -r DOTPATH="${HOME}/dotfiles"
declare -r GITHUB_URL="https://github.com/sho-t/dotfiles.git"
declare -r GITHUB_UTILS_URL="https://raw.githubusercontent.com/sho-t/dotfiles/master/src/utils.sh"

# --------------------------------------------------
# download dotfiles
# --------------------------------------------------
 
load_utils() {

  local tmpFile="$(mktemp /tmp/XXXXX)"

  curl -LsS "$GITHUB_UTILS_URL" -o "$tmpFile" \
  && . "$tmpFile" \
  && rm -rf "$tmpFile" \
  && return 0

  return 1
}

download_dotfiles() {
  if has "git"; then
    p_start "Downloading dotfiles"  
    git clone --recursive "$GITHUB_URL" "$DOTPATH"
  else
    p_error "Git required" 
    exit 1
  fi
  p_success "Download dotfiles"
}

main() {
  
  load_utils

  p_start "Dotfiles Setup Starting"
  download_dotfiles

  cd "$DOTPATH/src"

  # link dotfiles
  ./link.sh

  # Install formula
  ./brew.sh

  p_info "Setup Successful"
}

main "$@"
