#!/bin/bash

# --------------------------------------------------
# | anyenv setup function
# --------------------------------------------------

if [ ! -d ${HOME}/.anyenv ]; then
  anyenv install --init
  anyenv install nodenv
  exec $SHELL -l
fi
