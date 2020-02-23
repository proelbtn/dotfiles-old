is_linux && alias ls="ls --color=tty"
is_darwin && alias ls="ls -G"

alias cdtemp="cd $(mktemp -d)"
alias reload="exec ${SHELL}"

is_linux && alias copy="xclip -i -selection c"
is_linux && alias paste="xclip -o -selection c"

alias grep="grep --color=auto"

