.SILENT:


all: install


DEPENDENCIES ?= 
PREINSTALL ?= 
POSTINSTALL ?= 

ifeq ($(shell uname), Darwin)
	DEPENDENCIES := ${DEPENDENCIES_DARWIN} ${DEPENDENCIES}
	PREINSTALL := ${PREINSTALL_DARWIN} ${PREFINSTALL}
	POSTINSTALL := ${POSTINSTALL_DARWIN} ${POSTINSTALL}
endif

ifeq ($(shell uname), Linux)
	DEPENDENCIES := ${DEPENDENCIES_LINUX} ${DEPENDENCIES}
	PREINSTALL := ${PREINSTALL_LINUX} ${PREINSTALL}
	POSTINSTALL := ${POSTINSTALL_LINUX} ${POSTINSTALL}
endif


${DIRECTORIES}:
	mkdir -p $@

.PHONY: ${DEPENDENCIES} 
${DEPENDENCIES}:
	@if [ -d "${ROOT}/$@" ]; then cd "${ROOT}/$@"; $(MAKE) install; else echo "no such module: $@"; fi


# DEPENDENCIES: module names which this module depends on
# PREINSTALL: target names which will be executed before anything
# TARGETS: target names which will be executed
# POSTINSTALL: target names which will be executed after anything
.PHONY: install
install: \
	${HOME} ${XDG_CACHE_HOME} ${XDG_CONFIG_HOME} ${XDG_DATA_HOME} \
	${DEPENDENCIES} ${PREINSTALL} ${DIRECTORIES} ${TARGETS} ${POSTINSTALL}

${XDG_CACHE_HOME} ${XDG_CONFIG_HOME} ${XDG_DATA_HOME}:
	mkdir -p $@

.PHONY: clean
clean:
	rm -rf ${TARGETS}

.PHONY: fail
fail:
	false
