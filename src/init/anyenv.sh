#!/bin/bash

# --------------------------------------------------
# | anyenv setup function
# --------------------------------------------------

if [ ! -d ${HOME}/.anyenv ]; then
  git clone https://github.com/riywo/anyenv ~/.anyenv
  exec $SHELL -l
fi
