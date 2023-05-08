#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" && . "utils.sh"

declare -r DOTPATH="${HOME}/dotfiles"
declare -r CONFIG_DIR="${HOME}/.config"

declare -r GIT_CONFIGS="${DOTPATH}/.config/git/config*"
# --------------------------------------------------
# | link file function
# --------------------------------------------------

make_directories() {
  mkdir -p ${HOME}/{.config,.local/share,.cache}
  mkdir -p ${CONFIG_DIR}/{git,tmux,ripgrep}
}

create_symlinks() {
  cd $DOTPATH
  for dotfile in .??*
  do
    [ "$dotfile" = ".git" ] && continue
    [ "$dotfile" = ".gitignore" ] && continue
    [ "$dotfile" = ".config" ] && continue

    ln -snf "$PWD/$dotfile" $HOME
  done

  # neovim
  ln -snf "$PWD/.config/nvim" $CONFIG_DIR

  #tmux
  ln -snf "$PWD/.config/tmux/tmux.conf" $CONFIG_DIR/tmux

  # ripgrep
  ln -snf "$PWD/.config/ripgrep/ripgreprc" $CONFIG_DIR/ripgrep/config

  #git 
  for g in $GIT_CONFIGS
  do
    ln -snf $g $CONFIG_DIR/git
  done
}

main() {
  p_start "Create symbolic links"
  make_directories
  create_symlinks
  p_success "Linked"
}

main "$@"

