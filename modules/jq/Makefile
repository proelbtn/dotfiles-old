include ../makefiles/environments.mk

DEPENDENCIES_DARWIN := homebrew
PREINSTALL_DARWIN := jq

include ${ROOT}/makefiles/commons.mk

.PHONY: jq 
jq:
	which -s jq \
		|| brew install jq 

