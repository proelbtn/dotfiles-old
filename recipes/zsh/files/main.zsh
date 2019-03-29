#!/usr/bin/zsh

###
# some essential function
###

is_osx() {
    uname -a | grep "Darwin" >/dev/null 2>&1
    return $?
}

is_linux() {
    uname -a | grep "Linux" >/dev/null 2>&1
    return $?
}

###
# environment variables
###

export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-${HOME}/.config}"
export PATH="${XDG_CONFIG_HOME}/zsh/bin:${PATH}"
export EDITOR="nvim"

###
# zplug
###

source ~/.zplug/init.zsh

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

if is_linux
then
    alias ls="ls --color"
fi

alias ttt="cd $(mktemp -d)"
alias rrr="source ~/.zshrc"

alias pingg="ping 8.8.8.8"

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

