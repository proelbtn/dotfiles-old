
is_osx() {
    uname -a | grep "Darwin" >/dev/null 2>&1
    return $?
}

is_linux() {
    uname -a | grep "Linux" >/dev/null 2>&1
    return $?
}

export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-${HOME}/.config}"
export PATH="${XDG_CONFIG_HOME}/zsh/bin:${PATH}"

source ~/.zplug/init.zsh

zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
if ! zplug check --verbose
then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

if is_linux
then
    alias ls="ls --color"
fi


if test "$(ls "${XDG_CONFIG_HOME}/zsh/sources")" != ""
then
    for file in "$(ls "${XDG_CONFIG_HOME}/zsh/sources" | sort)"
    do
        [[ "$(echo ${file} | grep -e "^.*\.zsh$")" != "" ]] \
            && source "${XDG_CONFIG_HOME}/zsh/sources/${file}"
    done
fi

zplug load --verbose
