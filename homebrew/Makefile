include ../makefiles/environments.mk

TARGETS := \
	/usr/local/bin/brew

POSTINSTALL := \
	tap-homebrew-cask

include ${ROOT}/makefiles/commons.mk

INSTALL_SCRIPT_URL := https://raw.githubusercontent.com/Homebrew/install/master/install

/usr/local/bin/brew:
	/usr/bin/ruby -e "$$(curl -fsSL ${INSTALL_SCRIPT_URL})"

tap-homebrew-cask:
	brew tap homebrew/cask
