#!/bin/bash

# ================================================================================
# 【For Mac】MacOS.sh : Setup MacOS
# ================================================================================

if [ "$(uname)" != "Darwin" ] ; then
  echo 'Not macOS!'
  exit 1
fi

echo 'Setup MacOS'

mkdir -p ~/Pictures/ScreenShots
defaults write com.apple.screencapture location ~/Pictures/ScreenShots
defaults write com.apple.screencapture name ScreenShot
defaults write com.apple.screencapture include-date -bool false
defaults write com.apple.screencapture type -string "png"


# ================================================================================
# Dock
# ================================================================================

defaults write com.apple.dashboard mcx-disabled -bool true
