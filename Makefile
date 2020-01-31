include ./makefiles/environments.mk

MODULES := $(shell ls -d */ | sed 's:/::g')

all:

minimal: zsh

full:

.PHONY: ${MODULES} 
${MODULES}:
	@if [ -d "./$@" ]; then cd "./$@"; $(MAKE) install; else echo "no such module: $@"; fi

