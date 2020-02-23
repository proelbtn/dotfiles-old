include ../makefiles/environments.mk

DEPENDENCIES_LINUX := fail
DEPENDENCIES := zsh

PREINSTALL_DAWRIN := homebrew

TARGETS := \
	/usr/local/bin/brew \
	${XDG_CONFIG_HOME}/zsh/sources/50_homebrew.zsh

include ${ROOT}/makefiles/commons.mk

INSTALL_SCRIPT_URL := https://raw.githubusercontent.com/Homebrew/install/master/install

.PHONY: homebrew
homebrew:
	which -s homebrew ||
		/usr/bin/ruby -e "$$(curl -fsSL ${INSTALL_SCRIPT_URL})"

${XDG_CONFIG_HOME}/zsh/sources/50_homebrew.zsh: ${PWD}/50_homebrew.zsh
	ln -sf $^ $@
