CWD := $(shell pwd)
ROOT := $(shell git rev-parse --show-toplevel)

XDG_CACHE_HOME ?= ${HOME}/.cache

XDG_CONFIG_HOME ?= ${HOME}/.config
XDG_CONFIG_DIRS ?= /etc/xdg

XDG_DATA_HOME ?= ${HOME}/.local/share
XDG_DATA_DIRS ?= /usr/local/share:/usr/share
