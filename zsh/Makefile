include ../makefiles/environments.mk

SCRIPTS := $(shell cd scripts && find . -type f)
SCRIPTS := ${SCRIPTS:./%=${HOME}/.local/bin/%}

DIRECTORIES := \
	${HOME}/.local/bin \
	${XDG_DATA_HOME} \
	${XDG_CONFIG_HOME}/zsh \
	${XDG_CONFIG_HOME}/zsh/bin \
	${XDG_CONFIG_HOME}/zsh/sources

TARGETS := \
	${HOME}/.zshrc \
	${XDG_DATA_HOME}/zplugin \
	${SCRIPTS}

include ${ROOT}/makefiles/commons.mk

${HOME}/.zshrc: ${CWD}/main.zsh
	ln -sf $^ $@

${XDG_DATA_HOME}/zplugin:
	git clone https://github.com/zdharma/zplugin.git $@

${SCRIPTS}:
	ln -sf ${@:${HOME}/.local/bin/%=${CWD}/scripts/%} $@
