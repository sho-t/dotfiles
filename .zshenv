typeset -U path PATH

path=( \
  /usr/local/bin(N-/) \
  ~/.bin(N-/) \
  ~/.go/bin(N-/)
  "$path[@]" \
  )

typeset -gx -U fpath

fpath=( \
  /usr/local/share/zsh/site-functions(N-/) \
  ~/.zsh/completions(N-/) \
  ~/.zsh/functions(N-/) \
  $fpath \
  )


