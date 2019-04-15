install() {
    info "Installing termite..."
    mkdir -p ${XDG_CONFIG_HOME}/termite
    mkdir -p ${XDG_CONFIG_HOME}/zsh/sources
    ln -sf "${DOTTT_ROOT}/files/config" "${XDG_CONFIG_HOME}/termite/config"
}
