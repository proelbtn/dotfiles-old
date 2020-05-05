export ANYENV_ROOT="${XDG_DATA_HOME}/anyenv"
export PATH="${ANYENV_ROOT}/bin:${PATH}"
export GOENV_GOPATH_PREFIX="${HOME}/.local/go"

[ ! -d "${ANYENV_ROOT}/anyenv-install" ] && yes | anyenv install --init || true
eval "$(anyenv init -)"

export PATH="${PATH}:${GOPATH}/bin"

