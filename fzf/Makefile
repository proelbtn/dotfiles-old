include ../makefiles/environments.mk

DEPENDENCIES_DARWIN := homebrew
DEPENDENCIES := zsh
PREINSTALL_DARWIN := fzf

TARGETS := \
	${XDG_CONFIG_HOME}/zsh/sources/50_fzf.zsh

include ${ROOT}/makefiles/commons.mk

.PHONY: fzf 
fzf:
	which -s fzf \
		|| brew install fzf 

${XDG_CONFIG_HOME}/zsh/sources/50_fzf.zsh: ${CWD}/50_fzf.zsh
	ln -sf $^ $@

