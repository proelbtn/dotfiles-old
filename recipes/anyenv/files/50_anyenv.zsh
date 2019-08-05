export PATH="${XDG_CONFIG_HOME}/anyenv/anyenv/bin:${PATH}"

if [ ! -d "${XDG_CONFIG_HOME}/anyenv/anyenv-install" ]
then
    yes | anyenv install --init
fi

eval "$(anyenv init -)"

# settings for goenv

if [ "$(which goenv)" != "" ]
then
  export GOENV_GOPATH_PREFIX="${HOME}/.local/go"

  goenv rehash

  if [ "${GOPATH}" != "" ]
  then
    export PATH="${PATH}:${GOPATH}/bin"
  fi
fi
