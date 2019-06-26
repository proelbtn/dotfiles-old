if is_macos
then
    DEPENDS_ON="essentials/brew"
fi

install() {
    info "Installing fd..."

    if is_macos
    then
        brew install fd 
    fi
}
