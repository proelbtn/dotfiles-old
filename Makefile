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

URL_DEIN_VIM = "https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh"

install/nvim: ensure/XDG_CONFIG_DIR install/nvim/dein.vim
	ln -sf "$(PWD)/src/nvim/init.vim" "$(XDG_CONFIG_DIR)/nvim/init.vim"

# TODO: try to download with curl and wget
# dein.vim is installed in ~/.config/nvim/dein.vim
install/nvim/dein.vim:
	curl $(URL_DEIN_VIM) | sh /dev/stdin "$(HOME)/.config/nvim/dein.vim"


