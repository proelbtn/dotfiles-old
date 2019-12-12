include ../makefiles/environments.mk

TARGETS := \
	${XDG_CONFIG_HOME}/zsh/bin/deadman \

.PHONY: install
install: zsh ${TARGETS}

.PHONY: zsh
zsh:
	cd ../zsh; make install

${XDG_CONFIG_HOME}/zsh/bin/deadman:
	curl https://raw.githubusercontent.com/upa/deadman/master/deadman > $@
	chmod +x $@

