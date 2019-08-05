if is_macos
then
    DEPENDS_ON="brew"
fi

install() {
    info "Installing ripgrep..."

    if is_macos
    then
        brew install ripgrep 
    fi
}
