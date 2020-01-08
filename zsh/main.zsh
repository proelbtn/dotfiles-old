#!/usr/bin/zsh

###
# environment variables
###

export PATH="${HOME}/.local/bin:${PATH}"

export XDG_CACHE_HOME="${XDG_CACHE_HOME:-${HOME}/.cache}"
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-${HOME}/.config}"
export XDG_CONFIG_DIRS="${XDG_CONFIG_DIRS:-/etc/xdg}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}"
export XDG_DATA_DIRS="${XDG_DATA_DIRS:-/usr/local/share:/usr/share}"

export TERM="xterm-256color"

silent which nvim && export EDITOR="nvim" \
    || (silent which vim && export EDITOR="vim") \
    || (silent which vi && export EDOTOR="vi")

export HISTFILE=~/.zsh_history
export HISTSIZE=1048576
export SAVEHIST=1048576

###
# zplug
###

source "${XDG_DATA_HOME}/zplugin/zplugin.zsh"

zplg light zsh-users/zsh-completions
zplg light zsh-users/zsh-autosuggestions
zplg light zsh-users/zsh-syntax-highlighting

zplg ice pick"async.zsh" src"pure.zsh"
zplg light sindresorhus/pure

setopt inc_append_history

autoload -U compinit
autoload -U zcalc

compinit


###
# aliases
###

is_linux && alias ls="ls --color"
is_darwin && alias ls="ls -G"

alias cdtemp="cd $(mktemp -d)"
alias reload="source ~/.zshrc"

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

alias ls="ls --color=tty"
alias lsd="ls -D */"

alias grep="grep --color=auto"

###
# keybinding
###

bindkey -e

bindkey -r "^[b"
bindkey -r "^[f"
bindkey "^b" backward-word
bindkey "^f" forward-word

###
#
###

# refs: https://stackoverflow.com/questions/17991007/how-to-disable-keybinding-in-tmux
stty -ixon -ixoff


  

###
# external script loading
###

if [ "$(ls "${XDG_CONFIG_HOME}/zsh/sources")" != "" ]
then
    for file in $(ls "${XDG_CONFIG_HOME}/zsh/sources" | sort)
    do
        [ "$(echo ${file} | grep -e "^.*\.zsh$")" != "" ] \
            && source "${XDG_CONFIG_HOME}/zsh/sources/${file}"
    done
fi

