export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-${HOME}/.config}"

export PATH="${XDG_CONFIG_HOME}/zsh/bin:${PATH}"

if test "$(ls "${XDG_CONFIG_HOME}/zsh/sources")" != ""
then
    for file in "$(ls "${XDG_CONFIG_HOME}/zsh/sources" | sort)"
    do
        [[ "$(echo ${file} | grep -e "^.*\.zsh$")" != "" ]] \
            && source "${XDG_CONFIG_HOME}/zsh/sources/${file}"
    done
fi