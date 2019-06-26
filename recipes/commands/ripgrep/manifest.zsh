if is_macos
then
    DEPENDS_ON="essentials/brew"
fi

install() {
    info "Installing ripgrep..."

    if is_macos
    then
        brew install ripgrep 
    fi
}
