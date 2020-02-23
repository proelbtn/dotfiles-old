alias fzf="fzf --height 40% --reverse"

if which -s fzf-completion; then
  export FZF_COMPLETION_TRIGGER=''
  bindkey '^T' fzf-completion
  bindkey '^I' $fzf_default_completion
fi
