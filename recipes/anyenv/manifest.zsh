DEPENDS_ON="zsh"

install() {
    info "Installing anyenv..."

    mkdir -p ${XDG_CONFIG_HOME}/anyenv
    if [ ! -d "${XDG_CONFIG_HOME}/anyenv/anyenv" ]
    then
        git clone https://github.com/anyenv/anyenv ${XDG_CONFIG_HOME}/anyenv/anyenv
    fi

    mkdir -p ${XDG_CONFIG_HOME}/zsh/sources
    ln -sf "${DOTTT_ROOT}/files/50_anyenv.zsh" ${XDG_CONFIG_HOME}/zsh/sources
}
