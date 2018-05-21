#!/bin/bash

declare -r RICTYSTTF=/usr/local/opt/ricty/share/fonts/Ricty*.ttf


cp -f $RICTYSTTF ~/Library/Fonts/
fc-cache -vf
