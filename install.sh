#!/bin/bash

set -u

declare -r DOTPATH="${HOME}/dotfiles"
declare -r GITHUB_URL="https://github.com/sho-t/dotfiles.git"

# --------------------------------------------------
# utilities
# --------------------------------------------------
has() {
  type "$1" > /dev/null 2>&1
}

# --------------------------------------------------
# download
# --------------------------------------------------
if has "git"; then
  echo "Downloading dotfiles..."  
  git clone --recursive "$GITHUB_URL" "$DOTPATH"
else
  echo "git required" 
  exit 1
fi
echo "Download success!"

# --------------------------------------------------
# link file
# --------------------------------------------------
cd $DOTPATH
echo "start link..."
for dotfile in .??*
do
  [ "$dotfile" = ".git" ] && continue
  [ "$dotfile" = ".gitmodules" ] && continue
  [ "$dotfile" = ".gitignore" ] && continue

  ln -Fis "$PWD/$dotfile" $HOME
done
echo "Linked success!"

# --------------------------------------------------
# initialize
# --------------------------------------------------
if has "brew"; then
  echo "Already installed Homebrew ✔︎"
else
  echo "Installing Homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew update && brew upgrade
brew tap Homebrew/bundle
brew bundle --file=Brewfile
