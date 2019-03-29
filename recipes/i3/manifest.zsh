install() {
    info "Installing i3..."
    mkdir -p ${XDG_CONFIG_HOME}/i3
    ln -sf "${DOTTT_ROOT}/files/config" ${XDG_CONFIG_HOME}/i3/config
}
