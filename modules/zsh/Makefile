include ../makefiles/environments.mk

SCRIPTS := $(shell cd scripts && find . -type f)
SCRIPTS := ${SCRIPTS:./%=${HOME}/.local/bin/%}

SOURCES := \
	00_environments.zsh \
	10_aliases.zsh \
	10_keybinding.zsh 

DIRECTORIES := \
	${HOME}/.local/bin \
	${XDG_CONFIG_HOME}/zsh \
	${XDG_CONFIG_HOME}/zsh/sources

TARGETS := \
	${DIRECTORIES} \
	${HOME}/.zshrc \
	${SOURCES:%=${XDG_CONFIG_HOME}/zsh/sources/%} \
	${SCRIPTS}

POSTINSTALL := \
	${XDG_DATA_HOME}/zinit

include ${ROOT}/makefiles/commons.mk

${HOME}/.zshrc: ${CWD}/main.zsh
	ln -sf $^ $@


${XDG_CONFIG_HOME}/zsh/sources/00_environments.zsh: ${CWD}/00_environments.zsh
	ln -sf $^ $@

${XDG_CONFIG_HOME}/zsh/sources/10_aliases.zsh: ${CWD}/10_aliases.zsh
	ln -sf $^ $@

${XDG_CONFIG_HOME}/zsh/sources/10_keybinding.zsh: ${CWD}/10_keybinding.zsh
	ln -sf $^ $@

${SCRIPTS}:
	ln -sf ${@:${HOME}/.local/bin/%=${CWD}/scripts/%} $@

${XDG_DATA_HOME}/zinit:
	git clone https://github.com/zdharma/zinit.git $@
