install() {
    info "Installing neovim..."

    mkdir -p "${XDG_CONFIG_HOME}/nvim"
    ln -sf "${DOTTT_ROOT}/files/init.vim" "${XDG_CONFIG_HOME}/nvim"
}