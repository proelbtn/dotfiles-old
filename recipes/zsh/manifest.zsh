ZSH_ZPLUG_INSTALLER_URL="https://raw.githubusercontent.com/zplug/installer/master/installer.zsh"

install() {
    info "Installing zsh..."
    mkdir -p ${XDG_CONFIG_HOME}/zsh/{bin,sources}
    ln -sf "${DOTTT_ROOT}/files/main.zsh" ~/.zshrc

    if test ! -d "${HOME}/.zplug"
    then
        curl -sL --proto-redir -all,https "${ZSH_ZPLUG_INSTALLER_URL}" | zsh
    fi
}
