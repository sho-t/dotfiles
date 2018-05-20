typeset -U path PATH

path=( \
  /usr/local/bin(N-/) \
  ~/bin(N-/) \
  ~/.anyenv/bin(N-/) \
  ~/.go/bin(N-/)
  "$path[@]" \
  )

eval "$(anyenv init - --no-rehash)"
eval "$(thefuck --alias)"

export GOPATH=$HOME/.go
