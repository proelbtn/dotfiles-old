#!/bin/sh

cd $(dirname $0)

# ==============================================================================

# execute_on_recipe recipe_name command
execute_on_recipe() {
    [ $# -eq 2 ] || exit 1

    local RECIPE=$1
    local COMMAND=$2

    # construct install script
    SRC="${SRC}$(cat ./scripts/header.zsh);"
    SRC="${SRC}$(cat ./recipes/${RECIPE}/manifest.zsh);"
    SRC="${SRC}${COMMAND}"
    
    # execute install script
    sh -c "cd ./recipes/$1; ${SRC}"
    
    return $?
}

# ==============================================================================

# get_recipes
get_recipes() {
    ls ./recipes
}

# ==============================================================================

# get_dependencies recipe_name
get_dependencies() {
    [ $# -eq 1 ] || exit 1
    local RECIPE=$1
    execute_on_recipe ${RECIPE} __dottt_get_dependencies
    return $?
}

# install recipe_name
install() {
    [ $# -eq 1 ] || exit 1
    local RECIPE=$1

    [ "${INSTALL_STACK}" != "" ] || INSTALL_STACK="$(mktemp)"
    echo "${RECIPE}" >> "${INSTALL_STACK}"

    local DEPENDENCIES="$(get_dependencies "${RECIPE}")"
    for dependency in ${DEPENDENCIES}
    do
        [ "$(cat "${INSTALL_STACK}" | grep "${dependency}")" != "" ] || install "${dependency}"
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
        shift; 
        if [ $# -eq 0 ]
        then
            echo "Error: please specify the recipe's name"
            usage
            exit 1
        fi

        for recipe in $([ "$@" != "all" ] && echo "$@" || get_recipes)
        do
            install $recipe
        done
        ;;
    list ) 
        shift; 
        get_recipes | sort | xargs
        ;;
    help ) usage ;;
    * ) 
        echo "Error: can't recognize command '$1'"
        usage 
        ;;
esac
