DEPENDS_ON="zsh"

install() {
    info "Installing deadman..."

    curl https://raw.githubusercontent.com/upa/deadman/master/deadman > "${XDG_CONFIG_HOME}/zsh/bin/deadman"
    chmod +x "${XDG_CONFIG_HOME}/zsh/bin/deadman"
}
