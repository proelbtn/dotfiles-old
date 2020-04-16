include ../.utils/setup.mk

MODULE_NAME := bpftrace

install-deps :=
setup-deps :=

install:
	@if ! which bpftrace >/dev/null 2>&1; then \
		if is_archlinux; then \
			sudo pacman -S bpftrace; \
		fi; \
	fi

setup:

teardown:

uninstall:

