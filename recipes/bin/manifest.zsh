DEPENDS_ON="zsh"

install() {
    info "Installing utilities..."

    for file in $(ls "${DOTTT_ROOT}/files")
    do
        ln -sf "${DOTTT_ROOT}/files/${file}" "${XDG_CONFIG_HOME}/zsh/bin/"
    done
}
