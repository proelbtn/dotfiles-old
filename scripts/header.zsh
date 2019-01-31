XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-${HOME}/.config}"

# local variables
DOTTT_ROOT="$(pwd)"

__dottt_install() {
    install
}

__dottt_get_dependencies() {
    echo ${DEPENDS_ON}
}
