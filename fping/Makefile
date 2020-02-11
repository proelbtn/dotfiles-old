include ../makefiles/environments.mk

DEPENDENCIES_DARWIN := homebrew
PREINSTALL_DARWIN := fping

include ${ROOT}/makefiles/commons.mk

.PHONY: fping 
fping:
	which -s fping \
		|| brew install fping 

