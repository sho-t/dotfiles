# COLORS
autoload -U colors ; colors
local DEFAULT="%{^[[0m%}"
local RED="%{^[[38;5;001m%}"
local MAGENTA="%{^[[38;5;201m%}"
local BLUE="%{^[[38;5;004m%}"
local CYAN="%{^[[38;5;014m%}"
local GREEN="%{^[[38;5;048m%}"

# PROMPT
autoload -Uz colors
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git svn
zstyle ':vcs_info:*' max-exports 6 # formatに入る変数の最大数
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' formats 'git:(%b)' '%c' '%u'
zstyle ':vcs_info:git:*' actionformats '%b@%r|%a' '%c' '%u'
setopt prompt_subst
function vcs_echo {
    local st branch color
    STY= LANG=en_US.UTF-8 vcs_info
    st=`git status 2> /dev/null`
    if [[ -z "$st" ]]; then return; fi
    branch="$vcs_info_msg_0_"
    if   [[ -n "$vcs_info_msg_1_" ]]; then color=${fg[green]} #staged
    elif [[ -n "$vcs_info_msg_2_" ]]; then color=${fg[red]} #unstaged
    elif [[ -n `echo "$st" | grep "^Untracked"` ]]; then color=${fg[blue]} # untracked
    else color=${fg[cyan]}
    fi
    echo "%{$color%}%{$branch%}%{$reset_color%}" | sed -e s/@/"%F{yellow}@%f%{$color%}"/
}
PROMPT='
%(?.%F{green}.%F{red})%f%F{red}%~%f `vcs_echo`$'

