#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && . "../utils.sh" \

./anyenv.sh
./zsh.sh
./ricty.sh
./neovim.sh
./fzf.sh

