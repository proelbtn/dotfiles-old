XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-${HOME}/.config}

function compile_zshrc() {
    content="$(cat ${XDG_CONFIG_HOME}/zsh/sources/*)"

    if test "$(uname -s)" = "Darwin"
    then
        hash="$(echo "${content}" | md5)"
    else
        hash="$(echo "${content}" | md5sum | sed 's:-::')"
    fi

    if test -f "${XDG_CONFIG_HOME}/zsh/hash"
    then
        if test "$(cat ${XDG_CONFIG_HOME}/zsh/hash)" = "${hash}"
        then
            return
        fi
    fi

    echo "${hash}" > "${XDG_CONFIG_HOME}/zsh/hash"
    echo "${content}" > "${XDG_CONFIG_HOME}/zsh/zshrc"
    zcompile "${XDG_CONFIG_HOME}/zsh/zshrc"

    echo "[UPDATE] => ${hash}"
}

compile_zshrc
source "${XDG_CONFIG_HOME}/zsh/zshrc"
