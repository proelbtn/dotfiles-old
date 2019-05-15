export PATH="${XDG_CONFIG_HOME}/anyenv/anyenv/bin:${PATH}"

if [ ! -d "${XDG_CONFIG_HOME}/anyenv/anyenv-install" ]
then
    yes | anyenv install --init
fi

eval "$(anyenv init -)"

# settings for goenv

export GOPATH="${XDG_DATA_HOME}/go"
export PATH="${PATH}:${GOPATH}/bin"