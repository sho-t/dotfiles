### COLORS ###
autoload -U colors ; colors
local DEFAULT="%{[0m%}"
local RED="%{[38;5;196m%}"
local MAGENTA="%{[38;5;201m%}"
local BLUE="%{[38;5;004m%}"
local CYAN="%{[38;5;044m%}"
local GREEN="%{[38;5;040m%}"

### PROMPT ###
autoload -Uz vcs_info

setopt prompt_subst

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' max-exports 6
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr ' ✚'
zstyle ':vcs_info:git:*' unstagedstr ' ✱'
zstyle ':vcs_info:git:*' formats '%F{blue}git:(%F{cyan}%b%c%u%F{blue})'
zstyle ':vcs_info:git:*' actionformats '%F{blue}git:(%F{cyan}%b%c%u%f|%F{red}%a%F{blue})'

precmd () { vcs_info }
PROMPT='
%(?.$GREEN.$RED) $MAGENTA%c$DEFAULT ${vcs_info_msg_0_}$DEFAULT ✘'

