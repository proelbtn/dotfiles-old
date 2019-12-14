install() {
    info "Installing neovim..."

    mkdir -p "${XDG_CONFIG_HOME}/nvim"
    ln -sf "${DOTTT_ROOT}/files/init.vim" "${XDG_CONFIG_HOME}/nvim"

    curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh \
        | sh /dev/stdin ${XDG_CONFIG_HOME}/nvim/dein.vim
    
}
