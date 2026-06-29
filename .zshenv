setopt no_global_rcs

if [ -x /usr/libexec/path_helper ]; then
    eval `/usr/libexec/path_helper -s`
fi

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


