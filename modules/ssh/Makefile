include ../makefiles/environments.mk

DIRECTORIES := \
	${HOME}/.ssh \
	${HOME}/.ssh/config.d

TARGETS := \
	${DIRECTORIES} \
	${HOME}/.ssh/config

include ${ROOT}/makefiles/commons.mk

${HOME}/.ssh/config: ${CWD}/config
	ln -sf $< $@
