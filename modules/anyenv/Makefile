include ../.utils/setup.mk

MODULE_NAME := anyenv

install-deps :=
setup-deps := dep-zsh-setup

install: ${install-deps}
	@clone https://github.com/anyenv/anyenv.git ${XDG_DATA_HOME}/anyenv

setup: ${setup-deps}
	@symlink ${CWD}/50_anyenv.zsh ${XDG_CONFIG_HOME}/zsh/sources/50_anyenv.zsh

teardown:

uninstall:

