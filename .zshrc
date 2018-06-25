# -------------------
# general 
# -------------------
umask 022
export LANG=ja_JP.UTF-8
export ZSH=$HOME/.zsh
export LESS='-iMR'
export MYSQL_PS1='\u@\h[\d] ✘'
export WORDCHARS='*?_.[]~=&;!#$%^(){}<>'

limit coredumpsize 0
setopt ignore_eof
setopt rm_star_silent
setopt print_eight_bit
setopt prompt_cr
setopt nobeep

# -------------------
# colors 
# -------------------
autoload -Uz colors; colors
local DEFAULT=%{$reset_color%}
local RED="%F{red}"
local MAGENTA="%F{magenta}"
local BLUE="%F{blue}"
local CYAN="%F{cyan}"
local GREEN="%F{green}"

# ls colors
eval $(gdircolors ~/.dircolors)
if [ -n "$LS_COLORS" ]; then
    zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
fi

# -------------------
# prompt 
# -------------------
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
%(?.$GREEN.$RED) ✔ $MAGENTA%c$DEFAULT ${vcs_info_msg_0_}$DEFAULT ✘ '

# -------------------
# completion
# -------------------
autoload -Uz compinit; compinit -C

setopt auto_list   
setopt auto_menu
setopt auto_param_keys
setopt auto_param_slash
setopt auto_remove_slash
setopt mark_dirs
setopt list_types
setopt interactive_comments
setopt magic_equal_subst

setopt always_last_prompt
setopt complete_in_word

setopt globdots
setopt list_packed
setopt nolistbeep

LISTMAX=0

bindkey "^I" menu-complete

zstyle ':completion:*' verbose yes
zstyle ':completion:*' completer _expand _complete _match _prefix _approximate _list _history
zstyle ':completion:*:default' menu select=2

zstyle ':completion:*' use-cache true
zstyle ':completion:*' group-name ''
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'
zstyle ':completion:*:cd:*' ignore-parents parent pwd
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin
zstyle ':completion:*:*files' ignored-patterns '*?.o' '*?~' '*\#'

# -------------------
# changing directories
# -------------------
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs

zstyle ':completion:*' recent-dirs-insert both
zstyle ':chpwd:*' recent-dirs-max 500
zstyle ':chpwd:*' recent-dirs-default true
zstyle ':chpwd:*' recent-dirs-pushd true

setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups

# -------------------
# history
# -------------------
export HISTFILE=~/.zsh_histfile
HISTSIZE=10000
SAVEHIST=10000

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

autoload history-search-end 
zle -N history-beginning-search-backward-end history-search-end 
zle -N history-beginning-search-forward-end history-search-end 
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

autoload -Uz smart-insert-last-word
zstyle :insert-last-word match '*([[:alpha:]/\\]?|?[[:alpha:]/\\])*'
zle -N insert-last-word smart-insert-last-word
bindkey '^]' insert-last-word

# -------------------
# alias
# -------------------
alias vim='nvim'

alias ls='gls --color=auto'
alias la='ls -A'
alias ll='ls -l'
alias lla='ls -lA'
alias reload='exec $SHELL -l'
alias mkdir='mkdir -p'
alias cp='cp -i'
alias rm='rm -i'

alias -g ...='../..'
alias -g ....='../../..'
alias -g L='| less'
alias -g H='| head'
alias -g G='| grep'
alias -g GI='| grep -ri'
alias -g V='| vim -R -'
alias -g Q=' --help | head'
alias -g CP='| pbcopy'

# -------------------
# others
# -------------------
(( ${+commands[node]} )) && source "$ZSH/node.zsh"
#hash tmux 2>/dev/null && source "$ZSH/functions/tmux.zsh"

[ -f ~/.zplug/init.zsh ] && source "$ZSH/zplug.zsh"
[ -f ~/.zshrc.local ] && source ~/.zshrc.local
