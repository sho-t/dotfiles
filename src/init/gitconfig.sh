#!/usr/bin/env bash

# 前提条件 dotfiles/.config/git/{config.shared,delta} のシンボリックコピー
# ファイルチェックやる

declare -r DOTFILE_DIR="${HOME}/dotfiles"
declare -r CONFIG_DIR="${HOME}/.config"

touch $CONFIG_DIR/git/{config,ignore}

git config --global include.path "$CONFIG_DIR/git/config.shared"
if builtin command -v "delta" >/dev/null 2>&1; then
  git config --global --add include.path "$CONFIG_DIR/git/config.delta"
fi

cat $DOTFILE_DIR/.config/git/ignore >> "$CONFIG_DIR/git/ignore"

