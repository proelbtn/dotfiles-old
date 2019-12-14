.PHONY: install
install: ${DEPENDENCIES} ${TARGETS}

.PHONY: ${DEPENDENCIES} 
${DEPENDENCIES}:
	@if [ -d "${ROOT}/$@" ]; then cd "${ROOT}/$@"; $(MAKE) install; else echo "no such module: $@"; fi

.PHONY: clean
clean:
	rm -f ${TARGETS} ${EXTRA_TARGETS}
