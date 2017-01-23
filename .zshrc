### Colors ###
autoload -U colors ; colors
local DEFAULT="%{[0m%}"
local RED="%F{red}"
local MAGENTA="%F{magenta}"
local BLUE="%F{blue}"
local CYAN="%F{cyan}"
local GREEN="%F{green}"

#LS_COLORS
eval $(gdircolors ~/.dircolors-solarized)
if [ -n "$LS_COLORS" ]; then
    zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
fi

### Prompt ###
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
%(?.$GREEN.$RED) $MAGENTA%c$DEFAULT ${vcs_info_msg_0_}$DEFAULT ✘ '

###Completion###
autoload _U compinit
compinit -C

setopt no_beep

###Alias###
alias ls='gls --color=auto'
alias la='ls -a'
alias reload_zsh='source ~/.zshrc'
alias '..'='cd ..'
alias -g ...='../..'
alias -g ....='../../..'

###Others###
#the fuck
eval "$(thefuck --alias)"

#pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
