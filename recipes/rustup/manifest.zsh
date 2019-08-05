DEPENDS_ON="zsh"

install() {
    info "Installing rustup..."

    local TEMPDIR="$(mktemp -d)"

    curl https://sh.rustup.rs > "${TEMPDIR}/rustup-init.sh"

    sh "${TEMPDIR}/rustup-init.sh" -y

    ln -sf "${DOTTT_ROOT}/files/50_anyenv.zsh" ${XDG_CONFIG_HOME}/zsh/sources
}