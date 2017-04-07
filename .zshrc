# LANG
export LANG=ja_JP.UTF-8

# Set the zsh root directoy
#export ZSH_ROOT=$HOME/.zsh

# Only run if tmux is actually installed.
#hash tmux 2>/dev/null && source "$ZSH_ROOT/functions/tmux.zsh"

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
zstyle ':vcs_info:git:*' stagedstr ' ✚ '
zstyle ':vcs_info:git:*' unstagedstr ' ✱ '
zstyle ':vcs_info:git:*' formats '%F{blue}git:(%F{cyan}%b%c%u%F{blue})'
zstyle ':vcs_info:git:*' actionformats '%F{blue}git:(%F{cyan}%b%c%u%f|%F{red}%a%F{blue})'

precmd () { vcs_info }
PROMPT='
%(?.$GREEN.$RED) $MAGENTA%c$DEFAULT ${vcs_info_msg_0_}$DEFAULT ✘ '

SPROMPT="$MAGENTA%{$suggest%}(*'~'%)? $BLUE< もしかして$CYAN%B%r%b $BLUEかな? [そう!(y), 違う!(n),a,e]:$DEFAULT "
###Completion###
autoload _U compinit
compinit -C

setopt auto_param_slash
setopt mark_dirs
setopt list_types
setopt auto_menu
setopt auto_param_keys
setopt correct
setopt correct_all
setopt magic_equal_subst

setopt always_last_prompt
setopt complete_in_word
setopt print_eight_bit
setopt globdots
setopt list_packed
setopt nolistbeep
LISTMAX=0

zstyle ':completion:*' verbose yes
zstyle ':completion:*' completer _expand _complete _match _prefix _approximate _list _history
zstyle ':completion:*:default' menu select=2

zstyle ':completion:*' use-cache true
zstyle ':completion:*' group-name ''
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'

###Cdr###
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs

zstyle ':completion:*' recent-dirs-insert both
zstyle ':chpwd:*' recent-dirs-max 500
zstyle ':chpwd:*' recent-dirs-default true
zstyle ':chpwd:*' recent-dirs-file "$HOME/.cache/shell/chpwd-recent-dirs"
zstyle ':chpwd:*' recent-dirs-pushd true

###cd###
setopt auto_cd
cdpath=(~)
setopt auto_pushd
setopt pushd_ignore_dups

###History###
export HISTFILE=~/.zsh_histfile
HISTSIZE=1000
SAVEHIST=1000

setopt share_history
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_save_no_dups
setopt hist_reduce_blanks
setopt hist_no_store
setopt hist_expand
setopt hist_verify
setopt inc_append_history

bindkey "^R" history-incremental-search-backward
bindkey "^S" history-incremental-search-forward

###Smart-insert-last-word###
autoload -Uz smart-insert-last-word

zle -N insert-last-word smart-insert-last-word
zstyle :insert-last-word match '*([[:alpha:]/\\]?|?[[:alpha:]/\\])*'
###Alias###
export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'

alias ls='gls --color=auto -a'
alias reload_zsh='source ~/.zshrc'
alias '..'='cd ..'
alias -g ...='../..'
alias -g ....='../../..'

alias -g L='| less'
alias -g H='| head'
alias -g G='| grep'
alias -g GI='| grep -ri'

alias copy='| pbcopy'
alias mkdir='mkdir -p'

 # Git alias
alias gitconfig='vim ~/.gitconfig'
alias branch\?='git branch |grep'

###Others###
typeset -U path PATH

#the fuck
eval "$(thefuck --alias)"

#pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if builtin type pyenv >/dev/null 2>&1; then 
  eval "$(pyenv init -)";
fi

#rbenv
eval "$(rbenv init -)"

#go
export GOPATH=$HOME/.go
export PATH=$HOME/.go/bin:$PATH

#node
export PATH=$HOME/.nodebrew/current/bin:$PATH
