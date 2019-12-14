include ./makefiles/environments.mk

MODULES := \
	anyenv \
	deadman \
	git \
	neovim \
	zsh

install: anyenv deadman git neovim zsh

.PHONY: ${MODULES} 
${MODULES}:
	@if [ -d "./$@" ]; then cd "./$@"; $(MAKE) install; else echo "no such module: $@"; fi

