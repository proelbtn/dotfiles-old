include ../makefiles/environments.mk

TARGETS := \
	${HOME}/.gitconfig \

include ${ROOT}/makefiles/commons.mk

${HOME}/.gitconfig: ${CWD}/config
	ln -sf $^ $@

