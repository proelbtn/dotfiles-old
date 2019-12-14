include ./makefiles/environments.mk

MODULES := \
	anyenv \
	deadman \
	git \
	zsh

install: anyenv deadman git zsh

.PHONY: ${MODULES} 
${MODULES}:
	@if [ -d "./$@" ]; then cd "./$@"; $(MAKE) install; else echo "no such module: $@"; fi

