export PATH="${HOME}/.local/bin:${PATH}"
export TERM="xterm-256color"

silent which nvim && export EDITOR="nvim" \
    || (silent which vim && export EDITOR="vim") \
    || (silent which vi && export EDOTOR="vi")

export HISTFILE=~/.zsh_history
export HISTSIZE=1048576
export SAVEHIST=1048576

