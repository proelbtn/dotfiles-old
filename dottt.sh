#!/bin/sh

cd $(dirname $0)

__dottt_info() {
    printf "\e[1;34m==> \e[1;39m" 1>&2
    echo $@ 1>&2
    printf "\e[0m" 1>&2
}

__dottt_internal_error() {
    printf "\e[1;31mInternal Error: \e[1;39m" 1>&2
    echo $@ 1>&2
    printf "\e[0m" 1>&2
}

__dottt_error() {
    printf "\e[1;31mError: \e[1;39m" 1>&2
    echo $@ 1>&2
    printf "\e[0m" 1>&2
}

__dottt_warning() {
    printf "\e[1;33mError: \e[1;39m" 1>&2
    echo $@ 1>&2
    printf "\e[0m" 1>&2
}

# ==============================================================================

# execute_on_recipe recipe_name command
__dottt_execute_on_recipe() {
    __dottt_is_a_valid_arguments ${FUNCNAME[0]} 2 $#

    local COMMAND=$2

    __dottt_is_a_valid_recipe_name "$1" || return 1

    # construct install script
    SRC="${SRC}$(cat ./scripts/header.zsh);"
    SRC="${SRC}$(cat ./recipes/$1/manifest.zsh);"
    SRC="${SRC}${COMMAND}"
    
    # execute install script
    zsh -c "cd ./recipes/$1; ${SRC}"
    
    return $?
}

# ==============================================================================

# get_recipes
__dottt_get_recipes() {
    for dir in $(find recipes -type d | sed 's:recipes/::')
    do
        if [ -f "./recipes/${dir}/manifest.zsh" ]
        then
            echo $dir
        fi
    done
}

__dottt_is_a_valid_recipe_name() {
    __dottt_is_a_valid_arguments ${FUNCNAME[0]} 1 $#

    if [ ! -f "./recipes/$1/manifest.zsh" ]
    then
        __dottt_error "it is not a valid recipe name ($1)."
        return 1
    fi
}

# __dottt_is_a_valid_arguments [funcname] [expected] [actually]
__dottt_is_a_valid_arguments() {
    if [ ! $2 -eq $3 ]
    then
        __dottt_internal_error "$1 takes $2 arguments, but $3 given."
        return 1
    fi
}

# ==============================================================================

__dottt_get_dependencies() {
    __dottt_is_a_valid_arguments ${FUNCNAME[0]} 1 $#
    __dottt_is_a_valid_recipe_name "$1" || return 1

    __dottt_execute_on_recipe "$1" __dottt_get_dependencies

    return $?
}

__dottt_install() {
    __dottt_is_a_valid_arguments ${FUNCNAME[0]} 1 $#
    __dottt_is_a_valid_recipe_name "$1" || return 1

    [ "${INSTALL_STACK}" != "" ] || INSTALL_STACK="$(mktemp)"
    echo "$1" >> "${INSTALL_STACK}"

    for dependency in $(__dottt_get_dependencies "$1")
    do
        [ "$(cat "${INSTALL_STACK}" | grep "${dependency}")" != "" ] || __dottt_install "${dependency}"
    done

    __dottt_execute_on_recipe "$1" __dottt_install

    return $?
}

# ==============================================================================

__dottt_usage() {
    echo "Usage: ${0} command [argments...]"
    echo ""
    echo "Available Commands:"
    echo "  install   Install files from recipes."
    echo "  help      Print usages."
    echo "  list      List recipes."
    echo "  test      Test whether it can be installed correctly."
}

# ==============================================================================

case $1 in
    install ) 
        shift; 
        if [ $# -eq 0 ]
        then
            echo "Error: please specify the recipe's name"
            __dottt_usage
            exit 1
        fi

        for recipe in $@
        do
            __dottt_install $recipe
        done
        ;;
    list ) 
        shift; 
        __dottt_get_recipes | sort
        ;;
    test ) 
        if [ $# -eq 0 ]
        then
            echo "Error: please specify the recipe's name"
            __dottt_usage
            exit 1
        fi

        for recipe in $(echo "$@")
        do
            __dottt_test $recipe
        done

        ;;
    help ) 
        __dottt_usage
        ;;
    * ) 
        echo "Error: can't recognize command '$1'"
        __dottt_usage 
        ;;
esac
