include ../makefiles/environments.mk

TARGETS := \
	${HOME}/.gitconfig \

.PHONY: install
install: ${TARGETS}

${HOME}/.gitconfig: ${CWD}/config
	ln -sf $^ $@

