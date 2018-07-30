typeset -U path PATH

path=( \
  /usr/local/bin(N-/) \
  ~/bin(N-/) \
  ~/.anyenv/bin(N-/) \
  ~/.go/bin(N-/)
  "$path[@]" \
  )

typeset -gx -U fpath
fpath=( \
  ~/.zsh/completions(N-/) \
  ~/.zsh/functions(N-/) \
  $fpath \
  )

cdpath=(~)

eval "$(anyenv init - --no-rehash)"
eval "$(thefuck --alias)"

export GOPATH=$HOME/.go
export FZF_DEFAULT_OPTS="
    --height 40% --reverse --border
    --prompt='➜  ' --margin=0,1 --inline-info
    --color fg:-1,bg:-1,hl:33,fg+:250,bg+:235,hl+:33
    --color info:37,prompt:37,pointer:230,marker:230,spinner:37"
export FZF_COMPLETION_TRIGGER=','
