CWD := $(shell pwd)
MODULE_ROOT := $(shell git rev-parse --show-toplevel)/modules

XDG_CACHE_HOME ?= ${HOME}/.cache

XDG_CONFIG_HOME ?= ${HOME}/.config
XDG_CONFIG_DIRS ?= /etc/xdg

XDG_DATA_HOME ?= ${HOME}/.local/share
XDG_DATA_DIRS ?= /usr/local/share:/usr/share


all: usage

usage:
	@echo "Name: ${MODULE_NAME}"

# core targets are the list of target which should be declared in Makefile
__CORE_TARGETS := install setup teardown uninstall

__MODULES := $(shell ls ${MODULE_ROOT})

define gen-deps-rule = 
.PHONY: dep-${1}-${2}
dep-${1}-${2}:
	@cd ../${1}; make ${2}
endef

define gen-deps-rules =
$(foreach target,${__CORE_TARGETS},$(eval $(call gen-deps-rule,${1},${target})))
endef

$(foreach mod,${__MODULES},$(eval $(call gen-deps-rules,${mod})))



SHELL := /bin/bash --init-file ${MODULE_ROOT}/.utils/helper-functions.sh -i



.PHONY: ${__CORE_TARGETS}

