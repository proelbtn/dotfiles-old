include ../makefiles/environments.mk

DEPENDENCIES_DARWIN := homebrew
PREINSTALL_DARWIN := ripgrep
PREINSTALL_LINUX := fail

include ${ROOT}/makefiles/commons.mk

.PHONY:
ripgrep:
	brew install ripgrep

