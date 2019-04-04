#!/bin/bash

ttfpath="/usr/local/opt/ricty/share/fonts/Ricty*.ttf"

# --------------------------------------------------
# | ricty setup function
# --------------------------------------------------

[ -z "$(ls $ttfpath 2>/dev/null)" ] && exit 1

cp -f $ttfpath ~/Library/Fonts/

git clone https://github.com/Lokaltog/vim-powerline ~/.vim-powerline
fontforge -script ~/.vim-powerline/fontpatcher/fontpatcher ~/Library/Fonts/Ricty-Regular.ttf

mv -f *.ttf ~/Library/Fonts/
fc-cache -vf

