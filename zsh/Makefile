include ../makefiles/environments.mk

TARGETS := \
	${HOME}/.zshrc \
	${HOME}/.zplug \
	${XDG_CONFIG_HOME}/zsh/bin \
	${XDG_CONFIG_HOME}/zsh/sources

.PHONY: install
install: ${TARGETS}

${HOME}/.zshrc: ${CWD}/main.zsh
	ln -sf $^ $@

${XDG_CONFIG_HOME}/zsh/bin:
	mkdir -p $@

${XDG_CONFIG_HOME}/zsh/sources:
	mkdir -p $@

${XDG_CONFIG_HOME}/zsh:
	mkdir -p $@

${HOME}/.zplug:
	git clone https://github.com/zplug/zplug.git $@

