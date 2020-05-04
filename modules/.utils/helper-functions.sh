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

is_darwin() {
  [ "$(uname -s)" = "Darwin" ]
  return $?
}

is_linux() {
  [ "$(uname -s)" = "Linux" ]
  return $?
}

if is_linux; then
  if [ -f "/etc/lsb-release" ]; then
    source /etc/lsb-release
  else
    print_warning "/etc/lsb-release is missing, some functionality may be not worked correctly."
  fi
fi

is_archlinux() {
  [ ${DISTRIB_ID} = "Arch" ]
  return $_
}

is_ubuntu() {
  [ ${DISTRIB_ID} = "Ubuntu" ]
  return $_
}

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

  if [ $# -eq 2 ]; then
    src=$1
    dst=$2

    print_info "Creating symbolic link: ${C_PATH}${dst} ${C_RESET}=> ${C_PATH}${src}"
    ln -sf ${src} ${dst}
  else
    srcs=""

    while [ $# -ne 0 ]; do
      if [ $# -eq 1 ]; then 
        dst="$1"
      else 
        srcs="${srcs} $1"
      fi
      shift
    done
  
    # If multiple src are passed, we expect dst is directory
    if [ -f ${dst} ]; then
      print_error "dst must be directory, not file when srcs are passed."
      return 1
    fi

    mkdir -p ${dst}
    for src in ${srcs}; do
      filename="$(basename ${src})"
      print_info "Creating symbolic link: ${C_PATH}${dst}/${filename} ${C_RESET}=> ${C_PATH}${src}"
      ln -sf ${src} ${dst}
    done
  fi
}

clone() {
  if [ -d $2 ]; then
    if [ "$(bash -c "cd $2; git remote get-url origin" 2>/dev/null)" != "$1" ]; then
      print_error 
      return 1
    fi

    print_info "Updating repository: ${C_PATH}$2"
    cd $2
    git pull origin master
  else 
    print_info "Cloning repository: ${C_URL}$1 ${C_RESET}=> ${C_PATH}$2"
    git clone $1 $2
  fi
}

