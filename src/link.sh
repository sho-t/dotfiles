#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" && . "utils.sh"

declare -r DOTPATH="${HOME}/dotfiles"
declare -r CONFIGDIR="${HOME}/.config"

# --------------------------------------------------
# | link file function
# --------------------------------------------------
create_symlinks() {
  cd $DOTPATH
  for dotfile in .??*
  do
    [ "$dotfile" = ".git" ] && continue
    [ "$dotfile" = ".gitmodules" ] && continue
    [ "$dotfile" = ".gitignore" ] && continue
    [ "$dotfile" = ".config" ] && continue

    ln -sniv "$PWD/$dotfile" $HOME
  done

  if [ ! -d $CONFIGDIR ]; then
    mkdir -r $CONFIGDIR
  fi

  ln -sniv "$PWD/.config/nvim" $CONFIGDIR
}

main() {
  p_start "Create symbolic links"
  create_symlinks
  p_success "Linked"
}

main "$@"
