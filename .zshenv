typeset -U path PATH

path=( \
  /opt/homebrew/bin(N-/) \
  /opt/homebrew/sbin(N-/) \
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


