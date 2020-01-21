include ../makefiles/environments.mk

DIRECTORIES := \
	${HOME}/.ssh \
	${HOME}/.ssh/config.d

TARGETS := \
	${HOME}/.ssh/config \
	${DIRECTORIES}

include ${ROOT}/makefiles/commons.mk

${HOME}/.ssh/config: ${CWD}/config
	ln -sf $< $@
