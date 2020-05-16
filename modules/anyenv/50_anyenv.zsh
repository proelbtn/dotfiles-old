export ANYENV_ROOT="${XDG_DATA_HOME}/anyenv"
export ANYENV_DEFINITION_ROOT="${ANYENV_ROOT}/anyenv-install"
export PATH="${ANYENV_ROOT}/bin:${PATH}"
export GOENV_GOPATH_PREFIX="${HOME}/.local/go"

[ ! -d "${ANYENV_DEFINITION_ROOT}" ] && yes | anyenv install --init || true
eval "$(anyenv init -)"

export PATH="${PATH}:${GOPATH}/bin"

