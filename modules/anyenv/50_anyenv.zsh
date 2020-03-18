export ANYENV_ROOT="${XDG_CONFIG_HOME}/anyenv"
export PATH="${ANYENV_ROOT}/bin:${PATH}"
export GOENV_GOPATH_PREFIX="${HOME}/.local/go"

[ ! -d "${ANYENV_ROOT}/anyenv-install" ] && yes | anyenv install --init || true
eval "$(anyenv init -)"

export PATH="${PATH}:${GOPATH}/bin"

# ===

#ENVS="$(command find ${ANYENV_ROOT}/envs/ -mindepth 1 -maxdepth 1 -type d)"
#
#BINS=""
#for env in $(echo ${ENVS}); do BINS="${BINS} $(command find ${env}/shims -mindepth 1 -type f)"; done
#
#FILES=""
#for env in $(echo ${ENVS}); do FILES="${FILES} $(basename ${env})"; done
#for bin in $(echo ${BINS}); do FILES="${FILES} $(basename ${bin})"; done
#
#TMPFILE="$(mktemp)"
#
#(
#for file in $(echo ${FILES}); do
#    echo "function ${file}() {"
#    echo "    eval \"\$(anyenv init -)\""
#    echo "    unset -f ${FILES}"
#    echo "    command ${file} \$@"
#    echo "}"
#  done
#) > ${TMPFILE}
#
#source ${TMPFILE}
