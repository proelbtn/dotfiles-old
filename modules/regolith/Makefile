include ../.utils/setup.mk

MODULE_NAME := regorith

install-deps :=
setup-deps :=

install:

setup:
	@for f in $$(find ${CWD}/regolith -type f); do \
		symlink $$f $$(dirname $$f | sed "s:${CWD}/regolith:${XDG_CONFIG_HOME}/regolith:"); \
	done

teardown:

uninstall:

