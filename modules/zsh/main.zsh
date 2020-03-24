#!/usr/bin/zsh

typeset -U PATH

export XDG_CACHE_HOME="${XDG_CACHE_HOME:-${HOME}/.cache}"
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-${HOME}/.config}"
export XDG_CONFIG_DIRS="${XDG_CONFIG_DIRS:-/etc/xdg}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}"
export XDG_DATA_DIRS="${XDG_DATA_DIRS:-/usr/local/share:/usr/share}"

export PATH="${HOME}/.local/bin:${PATH}"

export HISTFILE=~/.zsh_history
export HISTSIZE=65536
export SAVEHIST=65536

export TERM="xterm-256color"

silent which nvim && export EDITOR="nvim" \
    || (silent which vim && export EDITOR="vim") \
    || (silent which vi && export EDOTOR="vi")


source "${XDG_DATA_HOME}/zinit/zinit.zsh"

zinit ice wait"!0" lucid atload"_zsh_autosuggest_start"
zinit light zsh-users/zsh-autosuggestions

zinit ice wait"!0"
zinit light zsh-users/zsh-completions

zinit ice wait"!0" atload"zpcompinit"
zinit light zsh-users/zsh-syntax-highlighting

setopt inc_append_history

# refs: https://stackoverflow.com/questions/17991007/how-to-disable-keybinding-in-tmux
stty -ixon -ixoff

for file in $(command ls ${XDG_CONFIG_HOME}/zsh/sources/**/*.zsh); do
  zinit ice wait"!0" aliases
  zinit snippet ${file}
done


autoload -Uz promptinit
promptinit

prompt clint

setopt hist_ignore_dups
setopt extended_history




alias cdtemp="cd $(mktemp -d)"
alias reload="exec ${SHELL}"

is_linux && alias copy="xclip -i -selection c"
is_linux && alias paste="xclip -o -selection c"

is_linux && alias ls="ls -hF --color=tty"
is_darwin && alias ls="ls -G"

# show AS number, use ICMP for trace
alias traceroute="traceroute -AIn"
alias grep="grep --color=auto"


alias ll="ls -ailsF --full-time"



bindkey -e
bindkey -r "^[b"
bindkey -r "^[f"
bindkey "^b" backward-word
bindkey "^f" forward-word




# if you want to enable zprof (Zsh Profiler), you can add this line to ~/.zshenv
#   zmodload zsh/zprof && zprof
which zprof > /dev/null && zprof | less
