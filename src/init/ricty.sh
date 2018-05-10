#!/bin/bash

declare -r RICTYSTTF=/usr/local/opt/ricty/share/fonts/Ricty*.ttf

if test -f $RICTYSTTF ; then
  cp -f $RICTYSTTF ~/Library/Fonts/
  fc-cache -vf
fi
