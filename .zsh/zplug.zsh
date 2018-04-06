# -------------------
# zplug settings
# -------------------
source ~/.zplug/init.zsh

zplug 'zsh-users/zsh-syntax-highlighting', defer:2

zplug check || zplug install
zplug load
