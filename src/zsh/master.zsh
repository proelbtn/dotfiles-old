autoload -U compinit
compinit -C

HISTFILE="${HOME}/.config/zsh/history/history.log"
HISTSIZE=10000
SAVEHIST=100000
setopt share_history
setopt append_history
setopt histignorealldups
setopt histignorespace

export PATH="${PATH}:${HOME}/.local/bin"

function common() {
    alias cp="cp -i"
    alias mv="mv -i"
    alias rm="rm -i"
}

function linux() {
    alias ls="ls --color"
    alias ll="ls --color -l"

    common
}

function osx() {
    alias ls="ls -G"
    alias ll="ls -G -l"

    common
}

if test "$(uname)" = "Darwin"
then
    osx
elif test "$(expr substr $(uname -s) 1 5)" = "Linux"
then
    linux
fi

source "${HOME}/.config/zsh/highlighting/zsh-syntax-highlighting.zsh"


XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-${HOME}/.config}"

export PATH="${XDG_CONFIG_HOME}/bin:${PATH}"

function update_zsh_prompt {
  if [[ "$_debug" != "" ]]
  then
    PROMPT="%# "
    PROMPT2="> "
    RPROMPT=""
  else
    local _status="$?"

    local _time="$(date +'%Y/%m/%d %H:%M:%S')"
    local _id="%F{white}%n@%m"
    local _pwd="%F{yellow}%~%f"
    local _prompt="%(?.%F{green}.%F{red})%(?!(*'-')/ <!(*'~'%)? <)"

    PROMPT="$(echo -e "%B\n%F{cyan}[$_time]\n$_id $_pwd\n$_prompt %b")%F{default}"

    local _prompt2="%B%(?.%F{green}.%F{red})        <%F{white}%b"

    PROMPT2="$(echo -e "$_prompt2 ")"

    local _branch="$(git branch 2>/dev/null | grep "*" | sed 's/^* //')"
    
    [[ "$_branch" = "" ]] || _branch="[$_branch]"
    
    RPROMPT="%B%F{red}$_branch%F{white}%b"
  fi
}

function toggle-prompt {
  if [[ "$_debug" = "" ]]
  then
    _debug="true"
  else
    unset _debug
  fi
}

autoload -Uz add-zsh-hook
add-zsh-hook precmd update_zsh_prompt

