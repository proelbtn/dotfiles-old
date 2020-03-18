include ../makefiles/environments.mk

DEPENDENCIES_DARWIN := homebrew
PREINSTALL_DARWIN := mactex

TARGETS := \
	${HOME}/.latexmkrc

include ${ROOT}/makefiles/commons.mk

.PHONY: mactex
mactex:
	brew cask install mactex

${HOME}/.latexmkrc: ${CWD}/latexmkrc
	ln -sf $^ $@

