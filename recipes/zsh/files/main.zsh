export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-${HOME}/.config}"

is_osx() {
    uname -a | grep "Darwin" >/dev/null 2>&1
    return $?
}

is_linux() {
    uname -a | grep "Linux" >/dev/null 2>&1
    return $?
}

export PATH="${XDG_CONFIG_HOME}/zsh/bin:${PATH}"

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