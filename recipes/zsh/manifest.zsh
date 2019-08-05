install() {
    info "Installing zsh..."
    mkdir -p ${XDG_CONFIG_HOME}/zsh/bin
    mkdir -p ${XDG_CONFIG_HOME}/zsh/sources
    ln -sf "${DOTTT_ROOT}/files/main.zsh" ~/.zshrc

    if test ! -d "${HOME}/.zplug"
    then
        git clone https://github.com/zplug/zplug ~/.zplug
    fi
}
