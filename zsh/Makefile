include ../makefiles/environments.mk

SCRIPTS := $(shell cd scripts && find . -type f)
SCRIPTS := ${SCRIPTS:./%=${HOME}/.local/bin/%}

TARGETS := \
	${HOME}/.zshrc \
	${HOME}/.zplug \
	${XDG_CONFIG_HOME}/zsh/bin \
	${XDG_CONFIG_HOME}/zsh/sources \
	${SCRIPTS}

EXTRA_TARGETS := \
	${XDG_CONFIG_HOME}/zsh

include ${ROOT}/makefiles/commons.mk

${HOME}/.zshrc: ${CWD}/main.zsh
	ln -sf $^ $@

${XDG_CONFIG_HOME}/zsh/bin: ${XDG_CONFIG_HOME}/zsh
	mkdir -p $@

${XDG_CONFIG_HOME}/zsh/sources: ${XDG_CONFIG_HOME}/zsh
	mkdir -p $@

${XDG_CONFIG_HOME}/zsh:
	mkdir -p $@

${HOME}/.zplug:
	git clone https://github.com/zplug/zplug.git $@

${SCRIPTS}:
	ln -sf ${@:${HOME}/.local/bin/%=${CWD}/scripts/%} $@
