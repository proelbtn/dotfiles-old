if is_macos
then
    DEPENDS_ON="essentials/brew"
fi

install() {
    info "Installing jq..."

    if is_macos
    then
        brew install jq
    fi
}
