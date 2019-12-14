.PHONY: install
install: ${DEPENDENCIES} ${TARGETS}

.PHONY: ${DEPENDENCIES} 
${DEPENDENCIES}:
	@if [ -d "${ROOT}/$@" ]; then cd "${ROOT}/$@"; $(MAKE) install; else echo "no such module: $@"; fi

${DIRECTORIES}:
	mkdir -p $@

.PHONY: clean
clean:
	rm -rf ${TARGETS}
