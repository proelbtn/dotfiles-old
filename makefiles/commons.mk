.PHONY: install
install: ${DEPENDENCIES} ${TARGETS}

.PHONY: ${DEPENDENCIES} 
${DEPENDENCIES}:
	@if [ -d "${ROOT}/$@" ]; then cd "${ROOT}/$@"; $(MAKE) install; else echo "no such module: $@"; fi

${DIRECTORIES}:
	[ ! -d "$@" ] && mkdir -p $@ || true

.PHONY: clean
clean:
	rm -rf ${TARGETS}
