include ../makefiles/environments.mk

TARGETS := \
	/usr/local/bin/brew

include ${ROOT}/makefiles/commons.mk

INSTALL_SCRIPT_URL := https://raw.githubusercontent.com/Homebrew/install/master/install

/usr/local/bin/brew:
	/usr/bin/ruby -e "$$(curl -fsSL ${INSTALL_SCRIPT_URL})"
