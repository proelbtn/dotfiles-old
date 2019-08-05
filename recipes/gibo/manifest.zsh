DEPENDS_ON="zsh"

install() {
    info "Installing gibo..."

    curl https://raw.githubusercontent.com/simonwhitaker/gibo/master/gibo > "${XDG_CONFIG_HOME}/zsh/bin/gibo"
    chmod +x "${XDG_CONFIG_HOME}/zsh/bin/gibo"

    "${XDG_CONFIG_HOME}/zsh/bin/gibo" update
}
