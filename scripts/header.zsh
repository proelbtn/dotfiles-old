XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-${HOME}/.config}"

# local variables
DOTTT_ROOT="$(pwd)"

info() {
    printf "\e[1;34m==> \e[1;39m"
    echo $@
    printf "\e[0m"
}

error() {
    printf "\e[1;31mError: \e[1;39m"
    echo $@
    printf "\e[0m"
}

__dottt_install() {
    install
}

__dottt_get_dependencies() {
    echo ${DEPENDS_ON}
}
