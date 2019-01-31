#!/bin/sh

cd $(dirname $0)

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

list_recipes() {
    RECIPES=$(command ls recipes)

    echo ${RECIPES}
}

install_recipes() {
    # construct install script
    SRC="${SRC}$(cat ./scripts/header.zsh);"
    SRC="${SRC}$(cat ./recipes/$1/manifest.zsh);"
    SRC="${SRC}__dottt_install"

    # execute install script
    sh -c "cd ./recipes/$1; ${SRC}"
}

usage() {
    echo "Usage: ${0} command [argments...]"
    echo ""
    echo "Available Commands:"
    echo "  install   Installs files from recipes."
    echo "  help      Prints usages."
    echo "  list      Lists recipes."
}

case $1 in
    install ) 
        shift; install_recipes $@
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