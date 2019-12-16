export PATH="${XDG_CONFIG_HOME}/anyenv/bin:${PATH}"

[ ! -d "${XDG_CONFIG_HOME}/anyenv/anyenv-install" ] && yes | anyenv install --init || true
eval "$(anyenv init -)"

# settings for goenv
if which goenv >/dev/null 2>/dev/null
then
  export GOENV_GOPATH_PREFIX="${HOME}/.local/go"

  goenv rehash

  [ "${GOPATH}" != "" ] && export PATH="${PATH}:${GOPATH}/bin" || true
fi
