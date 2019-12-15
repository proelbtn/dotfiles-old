include ../makefiles/environments.mk

TARGETS := \
	${XDG_CONFIG_HOME}/dracula

include ${ROOT}/makefiles/commons.mk

${XDG_CONFIG_HOME}/dracula:
	git clone https://github.com/dracula/iterm.git $@
	open $@/Dracula.itermcolors
