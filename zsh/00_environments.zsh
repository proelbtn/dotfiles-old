typeset -gU PATH

export HISTFILE=~/.zsh_history
export PATH="${HOME}/.local/bin:${PATH}"
export TERM="xterm-256color"
source "${XDG_DATA_HOME}/zinit/zinit.zsh"

silent which nvim && export EDITOR="nvim" \
    || (silent which vim && export EDITOR="vim") \
    || (silent which vi && export EDOTOR="vi")

typeset -gU HISTSIZE; export HISTSIZE=2048
typeset -gU SAVEHIST; export SAVEHIST=2048
