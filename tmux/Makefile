include ../makefiles/environments.mk

DEPENDENCIES_DARWIN := homebrew
PREINSTALL_DARWIN := tmux

TARGETS := \
	${HOME}/.tmux.conf

include ${ROOT}/makefiles/commons.mk

.PHONY: tmux 
tmux:
	which -s tmux\
		|| brew install tmux

${HOME}/.tmux.conf: ${PWD}/tmux.conf
	ln -sf $^ $@
