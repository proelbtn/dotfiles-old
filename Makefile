include ./makefiles/environments.mk

MODULES := \
	anyenv \
	git \
	zsh

install: zsh anyenv git 

.PHONY: ${MODULES} 
${MODULES}:
	@if [ -d "./$@" ]; then cd "./$@"; make install; else echo "no such module: $@"; fi

