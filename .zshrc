# -------------------
# General 
# -------------------
umask 022
export LANG=ja_JP.UTF-8
export ZSH=$HOME/.zsh
export WORDCHARS='*?_.[]~=&;!#$%^(){}<>'
export EDITOR='nvim'

limit coredumpsize 0
setopt ignore_eof
setopt rm_star_silent
setopt print_eight_bit
setopt prompt_cr
setopt nobeep

# -------------------
# Colors 
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
# Prompt 
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

PROMPT='
%(?.$GREEN.$RED) ✔ $MAGENTA%c$DEFAULT ${vcs_info_msg_0_}$DEFAULT ✘ '

function precmd () { 
  vcs_info 
  ((${+TMUX})) && tmux refresh-client -S
}

# -------------------
# Completion
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


zstyle ':completion:*' verbose yes
zstyle ':completion:*' completer _expand _complete _match _prefix _approximate _list _history
zstyle ':completion:*:default' menu select=2

zstyle ':completion:*' use-cache true
zstyle ':completion:*' group-name ''
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin
zstyle ':completion:*:*files' ignored-patterns '*?.o' '*?~' '*\#'

# -------------------
# Changing directories
# -------------------
cdpath=(~)

setopt auto_cd
setopt auto_pushd
setopt pushd_minus
setopt pushd_ignore_dups

zstyle ':completion:*:cd:*' ignore-parents parent pwd

autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs

zstyle ':chpwd:*' recent-dirs-default true
zstyle ':chpwd:*' recent-dirs-max 500
zstyle ':chpwd:*' recent-dirs-file \
  $HOME/.cache/shell/.chpwd-recent-dirs-${TTY##*/} +
zstyle ':completion:*' recent-dirs-insert fallback

# -------------------
# History
# -------------------
HISTFILE=~/.zsh_histfile
HISTORY_IGNORE="(cd|pwd|l[sal])"
HISTSIZE=10000
SAVEHIST=10000

setopt extended_history
setopt hist_allow_clobber
setopt hist_fcntl_lock
setopt hist_find_no_dups 
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_no_functions
setopt hist_no_store

setopt hist_reduce_blanks
setopt hist_save_no_dups
setopt hist_verify
setopt inc_append_history_time

zshaddhistory() {
  emulate -L zsh
  [[ ${1%%$'\n'} != ${~HISTORY_IGNORE} ]]
}

# -------------------
# Key Bindings and Functions
# -------------------

bindkey -e

bindkey "^B" backward-word
bindkey "^F" forward-word
bindkey "^I" menu-complete

autoload -Uz history-search-end 
zle -N history-beginning-search-backward-end history-search-end 
zle -N history-beginning-search-forward-end history-search-end 
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

autoload -Uz smart-insert-last-word && zle -N insert-last-word smart-insert-last-word
zstyle :insert-last-word match '*([[:alpha:]/\\]?|?[[:alpha:]/\\])*'
bindkey '^]' insert-last-word

autoload -Uz free copy-buffer-widget fzf-cdr-widget \
  expand-alias-widget fzf-ripgrep-widget

zle -N copy-buffer-widget
bindkey '^Y' copy-buffer-widget

zle -N fzf-cdr-widget
bindkey '^D' fzf-cdr-widget

zle -N expand-alias-widget
bindkey ' ' expand-alias-widget

autoload -Uz zmv

zle -N fzf-ripgrep-widget
bindkey '\ef' fzf-ripgrep-widget

# -------------------
# Aliases
# -------------------
alias vi='nvim'
alias vim='nvim'

alias ls='gls --color=auto'
alias la='ls -A'
alias ll='exa -l --header --extended --sort=Name --time-style=long-iso --icons'
alias lla='ll -a'
alias reload='exec $SHELL -l'
alias mkdir='mkdir -p'
alias cp='cp -i'
alias rm='rm -i'
alias grep='grep --color=auto'
alias pdate='date "+%Y%m%d"'
alias pdatetime='date "+%Y%m%d%H%M%S"'

alias zmv='noglob zmv -W'

alias s='git status -sb'
alias fig='docker-compose'
alias xopen='open -a /Applications/Xcode.app'
alias pv='open -a Preview'
alias typora='open -a Typora'

alias -g ...='../..'
alias -g ....='../../..'
alias -g A='| awk'
alias -g C='| wc -l'
alias -g F='| fzf'
alias -g G='| grep'
alias -g GI='| grep -ri'
alias -g H='| head'
alias -g L='| less'
alias -g N='> /dev/null 2>&1'
alias -g Q=' --help | head'
alias -g V='| vim -R -'
alias -g Y='| pbcopy'

alias -s txt='vim'
alias -s html='open'
alias -s gz='tar -xvf'
alias -s {md,markdown}='typora'
alias -s {png,jpg,bmp,PNG,JPG,BMP}='pv'

# -------------------
# Source
# -------------------
[ -f ~/.zinit/bin/zinit.zsh ] && source "$ZSH/zinit.zsh"
(( ${+commands[node]} )) && source "$ZSH/node.zsh"
#hash tmux 2>/dev/null && source "$ZSH/functions/tmux.zsh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

# sdkman
export SDKMAN_DIR=$HOME/.sdkman
[[ -s $HOME/.sdkman/bin/sdkman-init.sh ]] && source $HOME/.sdkman/bin/sdkman-init.sh

eval "$(anyenv init - --no-rehash)"
eval "$(thefuck --alias)"

# -------------------
# Variables
# -------------------
export LESS='-iMR'
export MYSQL_PS1='\u@\h[\d] ✘'

# tmux
export TMUX_TMPDIR=/tmp

# go
export GOPATH=$HOME/.go

# bat
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export BAT_THEME="Solarized (dark)"

export RIPGREP_CONFIG_PATH=$HOME/.ripgreprc

# fzf
export FZF_COMPLETION_TRIGGER=','
typeset -Tgx FZF_DEFAULT_OPTS fzf_default_opts " " 
fzf_default_opts=(
  '--height=90%' #hogehoge
  '--reverse' #hogehoge
  '--border'
  '--inline-info'
  '--prompt="➜  "'
  '--margin=0,2'
  '--tiebreak=index'
  '--no-mouse'
  '--filepath-word'
)

() {
  local -A color_map=(
    [fg]='-1'
    [bg]='-1'
    [hl]='33'
    [fg+]='250'
    [bg+]='235'
    [hl+]='33'
    [info]='37'
    [prompt]='37'
    [pointer]='230'
    [marker]='230'
    [spinner]='37'
  )

  for x in "${(k)color_map[@]}"; do
    fzf_color_opts+=("${x}:${color_map[${x}]}") 
  done
  fzf_default_opts+=( '--color="'"${(j.,.)fzf_color_opts}"'"' )
}

() {
  local -a fzf_bind_opts=()
  local -A bind_map=(
    [?]='toggle-preview'
    [ctrl-a]='toggle-all'
    ['ctrl-]']='replace-query'
    [ctrl-w]='backward-kill-word'
    [ctrl-x]='jump'
    [ctrl-z]='ignore'
    [up]='preview-page-up'
    [down]='preview-page-down'
  )


  for x in "${(k)bind_map[@]}"; do
    fzf_bind_opts+=("${x}:${bind_map[${x}]}")
  done
  fzf_default_opts+=( '--bind="'"${(j:,:)fzf_bind_opts}"'"' )
}

# Ctrl + T
export FZF_CTRL_T_COMMAND="fd --type f -L "
typeset -Tgx FZF_CTRL_T_OPTS fzf_ctrl_t_opts " " 
fzf_ctrl_t_opts=(
  '--select-1'
  '--exit-0'
  '--preview "bat -r :100 --color=always --style=header,grid {}"'
  "--bind='ctrl-l:execute(tmux splitw -h -- nvim {})'"
  "--bind='>:reload($FZF_CTRL_T_COMMAND -H -E .git )'"
  "--bind='<:reload($FZF_CTRL_T_COMMAND)'"
)

# Alt + C
export FZF_ALT_C_COMMAND="fd --type d -L"
typeset -Tgx FZF_ALT_C_OPTS fzf_alt_c_opts " " 
fzf_alt_c_opts=(
  '--select-1'
  '--exit-0'
  '--preview "exa -T -L2 --color=always {} | head -200"'
  "--bind='>:reload($FZF_ALT_C_COMMAND -H -E .git )'"
  "--bind='<:reload($FZF_ALT_C_COMMAND)'"
)

# Ctrl + R
typeset -Tgx FZF_CTRL_R_OPTS fzf_ctrl_r_opts " " 
fzf_ctrl_r_opts=( 
  "--preview 'echo {}'"
  "--preview-window down:3:hidden:wrap"
)

