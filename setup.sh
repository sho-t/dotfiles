#!/bin/bash

set -u

cd $(dirname $0)

echo "start setup..."
for dotfile in .??*
do
  [ "$dotfile" = ".git" ] && continue
  [ "$dotfile" = ".gitmodules" ] && continue
  [ "$dotfile" = ".gitignore" ] && continue

  ln -Fis "$PWD/$dotfile" $HOME
done

cat << END

**************************************************
DOTFILES SETUP FINISHED! bye.
**************************************************

END
