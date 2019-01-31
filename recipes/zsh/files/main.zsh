export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-${HOME}/.config}"

export PATH="${PATH}:${XDG_CONFIG_HOME}/zsh/bin"

if test "$(ls "${XDG_CONFIG_HOME}/zsh/sources")" != ""
then
    for file in "$(ls "${XDG_CONFIG_HOME}/zsh/sources" | sort)"
    do
        source "${file}"
    done
fi