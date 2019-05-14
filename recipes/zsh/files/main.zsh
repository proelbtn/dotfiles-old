#!/usr/bin/zsh

###
# some essential function
###

silent() {
    $@ >/dev/null 2>&1
    return $?
}

is_macos() {
    uname -a | silent grep "Darwin"
    return $?
}

is_linux() {
    uname -a | silent grep "Linux"
    return $?
}


###
# environment variables
###

export XDG_DATA_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}"
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-${HOME}/.config}"
export XDG_DATA_DIRS="${XDG_DATA_DIRS:-/usr/local/share:/usr/share}"
export XDG_CONFIG_DIRS="${XDG_CONFIG_DIRS:-/etc/xdg}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-${HOME}/.cache}"
export PATH="${XDG_CONFIG_HOME}/zsh/bin:${PATH}"

silent which nvim && export EDITOR="nvim" \
    || silent which vim && export EDITOR="vim" \
    || silent which vi && export EDOTOR="vi"

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

if is_macos
then
    alias ls="ls -G"
fi

alias cdtemp="cd $(mktemp -d)"
alias reload="source ~/.zshrc"

alias pingg="ping 8.8.8.8"

if is_linux
then
  alias copy="xclip -i -selection c"
  alias paste="xclip -o -selection c"
fi

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

if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent > ~/.ssh-agent-thing
fi
if [[ ! "$SSH_AUTH_SOCK" ]]; then
    eval "$(<~/.ssh-agent-thing)"
fi
  
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

