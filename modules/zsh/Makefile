include ../.utils/setup.mk

MODULE_NAME := zsh

install-deps :=
setup-deps :=

install:

setup:
	@dir ${XDG_CONFIG_HOME}/zsh/{,sources}
	@symlink ${CWD}/main.zsh ${HOME}/.zshrc
	@symlink ${CWD}/scripts/* ${HOME}/.local/bin
	@clone https://github.com/zdharma/zinit.git ${XDG_DATA_HOME}/zinit

teardown:

uninstall:

