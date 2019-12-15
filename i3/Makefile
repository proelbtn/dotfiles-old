include ../makefiles/environments.mk

DIRECTORIES := \
	${XDG_CONFIG_HOME}/i3

TARGETS := \
	${XDG_CONFIG_HOME}/i3/config

include ${ROOT}/makefiles/commons.mk

${XDG_CONFIG_HOME}/i3/config: ${CWD}/config ${XDG_CONFIG_HOME}/i3
	ln -sf $< $@

