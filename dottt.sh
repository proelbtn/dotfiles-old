#!/bin/sh

cd $(dirname $0)

# ==============================================================================

execute_on_recipe() {
    test $# -eq 2 || return 1

    local RECIPE=$1
    local COMMAND=$2

    # construct install script
    SRC="${SRC}$(cat ./scripts/header.zsh);"
    SRC="${SRC}$(cat ./recipes/${RECIPE}/manifest.zsh);"
    SRC="${SRC}${COMMAND}"
    
    # execute install script
    sh -c "cd ./recipes/$1; ${SRC}"
    
    return $#
}

# ==============================================================================

get_recipes() {
    test $# -eq 1 || return 1

    if test "$1" = "all"
    then
        ls ./recipes
    elif stat ./recipes/"$1"
    then
        echo $1
    else
        return 1
    fi
}

# ==============================================================================

get_dependencies() {
    test $# -eq 1 || return 1
    local RECIPE=$1
    execute_on_recipe ${RECIPE} __dottt_get_dependencies
    return $?
}

install() {
    test $# -eq 1 || return 1
    local RECIPE=$1

    test "${INSTALL_STACK}" != "" || INSTALL_STACK="$(mktemp)"
    echo "${RECIPE}" >> "${INSTALL_STACK}"

    local DEPENDENCIES="$(get_dependencies "${RECIPE}")"
    for dependency in ${DEPENDENCIES}
    do
        test "$(cat "${INSTALL_STACK}" | grep "${dependency}")" != "" || install "${dependency}"
    done

    execute_on_recipe "${RECIPE}" __dottt_install
}

# ==============================================================================

usage() {
    echo "Usage: ${0} command [argments...]"
    echo ""
    echo "Available Commands:"
    echo "  install   Installs files from recipes."
    echo "  help      Prints usages."
    echo "  list      Lists recipes."
}

# ==============================================================================

case $1 in
    install ) 
        shift; install $@
        ;;
    list ) 
        shift; get_recipes all
        ;;
    help ) usage ;;
    * ) 
        echo "Error: can't recognize command '$1'"
        usage 
        ;;
esac
