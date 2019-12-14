#!/usr/bin/zsh

###
# environment variables
###

export XDG_CACHE_HOME="${XDG_CACHE_HOME:-${HOME}/.cache}"
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-${HOME}/.config}"
export XDG_CONFIG_DIRS="${XDG_CONFIG_DIRS:-/etc/xdg}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}"
export XDG_DATA_DIRS="${XDG_DATA_DIRS:-/usr/local/share:/usr/share}"

silent which nvim && export EDITOR="nvim" \
    || (silent which vim && export EDITOR="vim") \
    || (silent which vi && export EDOTOR="vi")


###
# zplug
###

source "${HOME}/.zplug/init.zsh"

zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2

zplug "mafredri/zsh-async", from:github
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme


if ! zplug check --verbose
then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load --verbose


###
# aliases
###

is_linux && alias ls="ls --color"
is_darwin && alias ls="ls -G"

alias cdtemp="cd $(mktemp -d)"
alias reload="source ~/.zshrc"

is_linux && alias copy="xclip -i -selection c"
is_linux && alias paste="xclip -o -selection c"


###
# keybinding
###

bindkey -e

bindkey -r "^[b"
bindkey -r "^[f"
bindkey "^b" backward-word
bindkey "^f" forward-word


###
#
###

# refs: https://stackoverflow.com/questions/17991007/how-to-disable-keybinding-in-tmux
stty -ixon -ixoff
  

###
# external script loading
###

if test "$(ls "${XDG_CONFIG_HOME}/zsh/sources")" != ""
then
    for file in "$(ls "${XDG_CONFIG_HOME}/zsh/sources" | sort)"
    do
        [[ "$(echo ${file} | grep -e "^.*\.zsh$")" != "" ]] \
            && source "${XDG_CONFIG_HOME}/zsh/sources/${file}"
    done
fi

