install() {
    mkdir -p ${XDG_CONFIG_HOME}/zsh/{bin,sources}
    ln -sf "${DOTTT_ROOT}/files/main.zsh" ~/.zshrc
}