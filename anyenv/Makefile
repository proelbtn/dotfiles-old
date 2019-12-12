include ../makefiles/environments.mk

TARGETS := \
	${XDG_CONFIG_HOME}/anyenv \
	${XDG_CONFIG_HOME}/zsh/sources/50_anyenv.zsh

.PHONY: install
install: zsh ${TARGETS}

zsh:
	cd ../zsh; make install

${XDG_CONFIG_HOME}/anyenv:
	git clone https://github.com/anyenv/anyenv $@

${XDG_CONFIG_HOME}/zsh/sources/50_anyenv.zsh: ${CWD}/50_anyenv.zsh
	ln -sf $^ $@
