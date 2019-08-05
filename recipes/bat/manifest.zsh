if is_macos
then
    DEPENDS_ON="brew"
fi

install() {
    info "Installing bat..."

    if is_macos
    then
        brew install bat
    fi
}
