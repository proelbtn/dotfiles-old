#!/bin/sh

cd $(dirname $0)

# ==============================================================================

execute_on_recipe() {
    if test $# -ne 2
    then
        return 1
    fi

    RECIPE=$1
    COMMAND=$2

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
    if test $# -ne 0
    then
        return 1
    fi

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

list_recipes() {
    RECIPES=$(command ls recipes)

    echo ${RECIPES}
}

# ==============================================================================

get_dependencies() {
    [[ $# -eq 1 ]] || return 1
    RECIPE=$1
    execute_on_recipe ${RECIPE} __dottt_get_dependencies
    return $?
}

install() {
    [[ $# -eq 1 ]] || return 1
    RECIPE=$1

    [[ "${INSTALL_STACK}" != "" ]] || INSTALL_STACK="$(mktemp)"
    echo "${RECIPE}" >> "${INSTALL_STACK}"

    DEPENDENCIES="$(get_dependencies $1)"
    for dependency in ${DEPENDENCIES}
    do
        [[ "$(cat "${INSTALL_STACK}" | grep "${dependency}")" != "" ]] || install "${dependency}"
    done
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
        shift; list_recipes $@
        ;;
    help ) usage ;;
    * ) 
        echo "Error: can't recognize command '$1'"
        usage 
        ;;
esac