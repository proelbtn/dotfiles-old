
install() {
    info "Installing awesome..."
    mkdir -p "${XDG_CONFIG_HOME}/awesome"
    ln -sf "${DOTTT_ROOT}/files/rc.lua" "${XDG_CONFIG_HOME}/awesome"
}