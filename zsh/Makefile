include ../makefiles/environments.mk

SCRIPTS := $(shell cd scripts && find . -type f)
SCRIPTS := ${SCRIPTS:./%=${HOME}/.local/bin/%}

DIRECTORIES := \
	${HOME}/.local/bin \
	${XDG_CONFIG_HOME}/zsh

TARGETS := \
	${DIRECTORIES} \
	${HOME}/.zshrc \
	${XDG_CONFIG_HOME}/zsh/sources/10_aliases.zsh \
	${XDG_CONFIG_HOME}/zsh/sources/10_keybinding.zsh \
	${SCRIPTS}

POSTINSTALL := \
	${XDG_DATA_HOME}/zplugin

include ${ROOT}/makefiles/commons.mk

${HOME}/.zshrc: ${CWD}/main.zsh
	ln -sf $^ $@

${XDG_CONFIG_HOME}/zsh/sources/10_aliases.zsh: ${CWD}/10_aliases.zsh
	ln -sf $^ $@

${XDG_CONFIG_HOME}/zsh/sources/10_keybinding.zsh: ${CWD}/10_keybinding.zsh
	ln -sf $^ $@

${SCRIPTS}:
	ln -sf ${@:${HOME}/.local/bin/%=${CWD}/scripts/%} $@

${XDG_DATA_HOME}/zplugin:
	git clone https://github.com/zdharma/zplugin.git $@
