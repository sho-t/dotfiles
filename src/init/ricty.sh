#!/bin/bash

ttfpath="/usr/local/opt/ricty/share/fonts/Ricty*.ttf"

# --------------------------------------------------
# | ricty setup function
# --------------------------------------------------

[ -z "$(ls $ttfpath 2>/dev/null)" ] && exit 1

cp -f $ttfpath ~/Library/Fonts/

git clone git clone --depth 1 https://github.com/ryanoasis/nerd-fonts.git ~/.nerd-fonts
fontforge -script ~/.nerd-fonts/font-patcher -c ~/Library/Fonts/Ricty-Regular.ttf

mv -f *.ttf ~/Library/Fonts/
fc-cache -vf

