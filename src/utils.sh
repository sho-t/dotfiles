#!/bin/bash

# --------------------------------------------------
# | utilities
# --------------------------------------------------

has() {
  type "$1" > /dev/null 2>&1
}

p_color() {
    printf "%b" \
        "$(tput setaf "$2" 2> /dev/null)" \
        "$1" \
        "$(tput sgr0 2> /dev/null)"
}

p_red() {
    p_color "$1" 1
}

p_green() {
    p_color "$1" 2
}

p_yellow() {
    p_color "$1" 3
}

p_blue() {
    p_color "$1" 4
}

p_purple() {
    p_color "$1" 5
}

p_cyan() {
    p_color "$1" 6
}

p_white() {
    p_color "$1" 7
}

p_start() {
  p_white "  ➜ $1"
  printf "...\n"
}

p_success() {
  p_white "  ✔ $1"
  printf "..."
  p_blue "OK\n"
}

p_warning() {
  p_yellow "  ! $1\n"
}

p_error() {
  p_red "  ✖ $1 $2\n"
}
