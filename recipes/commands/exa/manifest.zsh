if is_macos
then
    DEPENDS_ON="essentials/brew"
fi

install() {
    info "Installing exa..."

    if is_macos
    then
        brew install exa
    fi
}
