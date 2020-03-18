#!/usr/bin/zsh

export XDG_CACHE_HOME="${XDG_CACHE_HOME:-${HOME}/.cache}"
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-${HOME}/.config}"
export XDG_CONFIG_DIRS="${XDG_CONFIG_DIRS:-/etc/xdg}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}"
export XDG_DATA_DIRS="${XDG_DATA_DIRS:-/usr/local/share:/usr/share}"

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
  zplg ice wait"!0" aliases
  zplg snippet ${file}
done

# if you want to enable zprof (Zsh Profiler), you can add this line to ~/.zshenv
#   zmodload zsh/zprof && zprof
which zprof > /dev/null && zprof | less

autoload -Uz promptinit
promptinit

prompt clint

setopt hist_ignore_dups
setopt extended_history
