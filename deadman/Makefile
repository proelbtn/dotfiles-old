include ../makefiles/environments.mk

DEPENDENCIES := \
	zsh

TARGETS := \
	${XDG_CONFIG_HOME}/zsh/bin/deadman \

include ${ROOT}/makefiles/commons.mk

${XDG_CONFIG_HOME}/zsh/bin/deadman:
	curl https://raw.githubusercontent.com/upa/deadman/master/deadman > $@
	chmod +x $@

