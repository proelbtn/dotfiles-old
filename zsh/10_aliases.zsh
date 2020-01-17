is_linux && alias ls="ls --color=tty"
is_darwin && alias ls="ls -G"

alias cdtemp="cd $(mktemp -d)"
alias reload="exec ${SHELL}"

is_linux && alias copy="xclip -i -selection c"
is_linux && alias paste="xclip -o -selection c"

alias gia="git add"
alias giaa="git add ."
alias giap="git add -p ."
alias gic="git commit"
alias gica="git commit --amend"
alias gicane="git commit --amend"
alias gid="git diff"
alias gii="git init"
alias gip="git push"
alias gipo="git push origin"
alias gipoa="git push origin --all"
alias gipom="git push origin master"
alias gis="git status"

alias grep="grep --color=auto"

