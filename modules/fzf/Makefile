include ../makefiles/environments.mk

DEPENDENCIES_DARWIN := homebrew
DEPENDENCIES := zsh
PREINSTALL_DARWIN := fzf

SCRIPTS := $(shell cd scripts && find . -type f)
SCRIPTS := ${SCRIPTS:./%=${HOME}/.local/bin/%}

TARGETS := \
	${XDG_CONFIG_HOME}/zsh/sources/50_fzf.zsh \
	${SCRIPTS}

POSTINSTALL := \
	${XDG_CONFIG_HOME}/fzf \
	${XDG_CONFIG_HOME}/zsh/sources/40_fzf-completion.zsh

include ${ROOT}/makefiles/commons.mk

.PHONY: fzf 
fzf:
	which -s fzf \
		|| brew install fzf 

${XDG_CONFIG_HOME}/zsh/sources/50_fzf.zsh: ${CWD}/50_fzf.zsh
	ln -sf $^ $@

${SCRIPTS}:
	ln -sf ${@:${HOME}/.local/bin/%=${CWD}/scripts/%} $@

${XDG_CONFIG_HOME}/fzf:
	git clone https://github.com/junegunn/fzf.git $@

${XDG_CONFIG_HOME}/zsh/sources/40_fzf-completion.zsh: ${XDG_CONFIG_HOME}/fzf/shell/completion.zsh
	ln -sf $^ $@
