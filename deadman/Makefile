include ../makefiles/environments.mk

DEPENDENCIES := \
	zsh

TARGETS := \
	${HOME}/.local/bin/deadman \

include ${ROOT}/makefiles/commons.mk

${HOME}/.local/bin/deadman:
	curl https://raw.githubusercontent.com/upa/deadman/master/deadman > $@
	chmod +x $@

