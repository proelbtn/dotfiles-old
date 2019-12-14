include ../makefiles/environments.mk

SCRIPTS := $(shell cd scripts && find . -type f)
SCRIPTS := ${SCRIPTS:./%=${HOME}/.local/bin/%}

DIRECTORIES := \
	${HOME}/.local/bin \
	${XDG_CONFIG_HOME}/zsh \
	${XDG_CONFIG_HOME}/zsh/bin \
	${XDG_CONFIG_HOME}/zsh/sources

TARGETS := \
	${HOME}/.zshrc \
	${HOME}/.zplug \
	${DIRECTORIES} \
	${SCRIPTS}

include ${ROOT}/makefiles/commons.mk

${HOME}/.zshrc: ${CWD}/main.zsh
	ln -sf $^ $@

${HOME}/.zplug:
	git clone https://github.com/zplug/zplug.git $@

${SCRIPTS}: ${HOME}/.local/bin
	ln -sf ${@:${HOME}/.local/bin/%=${CWD}/scripts/%} $@
