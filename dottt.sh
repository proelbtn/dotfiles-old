#!/bin/bash

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

__dottt_silent() {
    $@ 1>/dev/null 2>&1
    return $?
}

__dottt_is_macos() {
    uname -a | __dottt_silent grep "Darwin"
    return $?
}

__dottt_is_linux() {
    uname -a | __dottt_silent grep "Linux"
    return $?
}

__dottt_tac() {
    if __dottt_is_linux
    then
        tac $@
    elif __dottt_is_macos
    then
        tail -r $@
    fi
}

# ==============================================================================

# execute_on_recipe recipe_name command
__dottt_execute_on_recipe() {
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
    if [ ! -f "./recipes/$1/manifest.zsh" ]
    then
        __dottt_error "it is not a valid recipe name ($1)."
        return 1
    fi
}

# ==============================================================================

__dottt_get_dependencies() {
    __dottt_is_a_valid_recipe_name "$1" || return 1

    __dottt_execute_on_recipe "$1" __dottt_get_dependencies

    return $?
}


__dottt_build_dependencies_stack() {
    # __dottt_build_dependencies_stack stack recipe
    if [ "$(cat "$1" | grep -E "^$2$")" = "" ]
    then
        echo "$2" >> "$1"
    fi

    for dep in $(__dottt_get_dependencies "$2")
    do
        if [ "$(cat "$1" | grep "^${dep}$")" = "" ]
        then
            __dottt_build_dependencies_stack "$1" "${dep}"
        fi
    done
}

__dottt_install() {
    # __dottt_install [recipes]
    #   In this function, we will install some recipes.
    #     1. check the arguments are valid
    #     2. plan the installation
    #     3. install the manifest

    # 1. check the arguments are valid
    for recipe in $@
    do
        if ! __dottt_is_a_valid_recipe_name "$1" 
        then
            __dottt_error "'$1' is not a valid recipe name..." 
            return 1
        fi
    done

    # 2. plan the installation
    STACK="$(mktemp)"
    for recipe in $@
    do
        __dottt_build_dependencies_stack "${STACK}" "${recipe}"
    done

    MANIFEST="$(mktemp)"
    __dottt_tac ${STACK} >> "${MANIFEST}"

    # 3. install the manifest
    for recipe in $(cat "${MANIFEST}")
    do
        __dottt_execute_on_recipe "${recipe}" __dottt_install
        STATUS=$?
        if [ ${STATUS} -ne 0 ]
        then
            return ${STATUS}
        fi
    done

    return 0
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

        __dottt_install $@
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
