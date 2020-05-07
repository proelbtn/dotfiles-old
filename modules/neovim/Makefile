include ../.utils/setup.mk

MODULE_NAME := neovim

PLUGIN_DIR := ${XDG_CONFIG_HOME}/nvim/dein.vim
INSTALL_DIR := ${PLUGIN_DIR}/repos/github.com/Shougo/dein.vim

install-deps :=
setup-deps :=

install:

setup:
	@dir ${XDG_CONFIG_HOME}/nvim
	@dir ${PLUGIN_DIR}
	@symlink ${CWD}/init.vim ${XDG_CONFIG_HOME}/nvim/init.vim
	@clone https://github.com/Shougo/dein.vim ${INSTALL_DIR}
	# refs: https://github.com/deoplete-plugins/deoplete-jedi/issues/194
	@rm -rf ${INSTALL_DIR}/../deoplete.nvim/rplugin/python3/deoplete/vendored/*


teardown:

uninstall:

