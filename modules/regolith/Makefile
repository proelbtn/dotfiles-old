include ../.utils/setup.mk

MODULE_NAME := regorith

install-deps :=
setup-deps :=

install:

setup:
	@dir ${XDG_CONFIG_HOME}/regorith/{compton,i3,i3xrocks/conf.d}
	@symlink ${CWD}/regolith/compton/* ${XDG_CONFIG_HOME}/regorith/compton
	@symlink ${CWD}/regolith/i3/* ${XDG_CONFIG_HOME}/regorith/i3
	@symlink ${CWD}/regolith/i3xrocks/conf.d/* ${XDG_CONFIG_HOME}/regorith/i3xrocks/conf.d

teardown:

uninstall:

