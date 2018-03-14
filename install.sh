#!/bin/bash

set -u

DOTPATH="${HOME}/dotfiles"
GITHUB_URL="https://github.com/sho-t/dotfiles.git"

has() {
  type "$1" > /dev/null 2>&1
}

if has "git"; then
  echo "Downloading dotfiles..."  
  git clone --recursive "$GITHUB_URL" "$DOTPATH"
else
  echo "git required" 
  exit 1
fi
echo "Download success!"
