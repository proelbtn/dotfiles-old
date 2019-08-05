test() {
    is_macos || error "brew can be installed on macOS." && return 1
}

install() {
    info "Installing brew..."
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
}