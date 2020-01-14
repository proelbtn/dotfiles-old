export PATH="${XDG_CONFIG_HOME}/anyenv/bin:${PATH}"
export GOENV_GOPATH_PREFIX="${HOME}/.local/go"

[ ! -d "${XDG_CONFIG_HOME}/anyenv/anyenv-install" ] && yes | anyenv install --init || true
eval "$(anyenv init -)"

export PATH="${PATH}:${GOPATH}/bin"

