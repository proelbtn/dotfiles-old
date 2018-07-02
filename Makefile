PWD = $(shell pwd)

# TODO: load environment variable
XDG_CONFIG_DIR = $(HOME)/.config

all:

# ==============================================================================

ensure/XDG_CONFIG_DIR:
	./scripts/ensure_directory.sh "$(XDG_CONFIG_DIR)"

# ==============================================================================

install: install/nvim

# ==============================================================================

install/nvim: ensure/XDG_CONFIG_DIR
	ln -sf "$(PWD)/src/nvim/init.vim" "$(XDG_CONFIG_DIR)/nvim/init.vim"
