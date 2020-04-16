include ../.utils/setup.mk

MODULE_NAME := gpg-agent

install-deps :=
setup-deps := dep-zsh-setup

install:

setup: ${setup-deps}
	@dir ${HOME}/.gnupg
	@symlink ${CWD}/gpg-agent.conf ${HOME}/.gnupg/gpg-agent.conf
	@symlink ${CWD}/90-gpg-agent.zsh ${XDG_CONFIG_HOME}/zsh/sources


teardown:

uninstall:

