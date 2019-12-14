include ../makefiles/environments.mk

DEPENDENCIES := \
	zsh

TARGETS := \
	${XDG_CONFIG_HOME}/anyenv \
	${XDG_CONFIG_HOME}/zsh/sources/50_anyenv.zsh

include ${ROOT}/makefiles/commons.mk

${XDG_CONFIG_HOME}/anyenv:
	git clone https://github.com/anyenv/anyenv $@

${XDG_CONFIG_HOME}/zsh/sources/50_anyenv.zsh: ${CWD}/50_anyenv.zsh
	ln -sf $^ $@

