install() {
    info "Installing tmux..."

    ln -sf "${DOTTT_ROOT}/files/tmux.conf" "${HOME}/.tmux.conf"
}