include ../makefiles/environments.mk

TARGETS := \
	${HOME}/.latexmkrc

include ${ROOT}/makefiles/commons.mk

${HOME}/.latexmkrc: ${CWD}/latexmkrc
	ln -sf $^ $@

