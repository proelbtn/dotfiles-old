#!/bin/bash

C_BOLD="\033[01m"
C_UNDERLINE="\033[02m"
C_RED="\033[31m"
C_GREEN="\033[32m"
C_YELLOW="\033[33m"
C_BLUE="\033[34m"
C_WHITE="\033[37m"
C_RESET="\033[00m\033[39m"

C_PATH="${C_YELLOW}${C_BOLD}"
C_URL="${C_GREEN}${C_BOLD}"

print_info() {
  echo -e "${C_BLUE}${C_BOLD}==> ${C_RESET}${1}${C_RESET}"
}

dir() {
  for dir in $@; do
    print_info "Creating directory: ${C_PATH}${dir}"
    mkdir -p ${dir}
  done
}

symlink() {
  if [ $# -le 1 ]; then
    return 1
  fi

  srcs=""
  dst=""

  while [ $# -ne 0 ]; do
    if [ $# -ne 1 ]; then 
      srcs="${srcs} $1"
    else 
      dst="$1"
    fi

    shift
  done
  
  for src in ${srcs}; do
    print_info "Creating symbolic link: ${C_PATH}${src} ${C_RESET} => ${C_PATH}${dst}"
    ln -sf ${src} ${dst}
  done
}

clone() {
  if [ -d $2 ]; then
    if [ "$(bash -c "cd $2; git remote get-url origin" 2>/dev/null)" != "$1" ]; then
      print_error 
      return 1
    fi
  else 
    print_info "Cloning repository: ${C_URL}$1 ${C_RESET}=> ${C_PATH}$2"
    git clone $1 $2
  fi
}

