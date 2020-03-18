include ../makefiles/environments.mk

DEPENDENCIES_DARWIN := homebrew
PREINSTALL_DARWIN := neovim

DIRECTORIES := \
	${XDG_CONFIG_HOME}/nvim

TARGETS := \
	${DIRECTORIES} \
	${XDG_CONFIG_HOME}/nvim/init.vim \
	${XDG_CONFIG_HOME}/nvim/dein.vim

include ${ROOT}/makefiles/commons.mk

.PHONY: neovim
neovim:
	which -s nvim \
		|| brew install neovim

${XDG_CONFIG_HOME}/nvim/init.vim: ${CWD}/init.vim ${XDG_CONFIG_HOME}/nvim
	${ENSURE_TARGET_DIR}
	ln -sf $< $@

${XDG_CONFIG_HOME}/nvim/dein.vim: ${XDG_CONFIG_HOME}/nvim 
	mkdir -p ${XDG_CONFIG_HOME}
	[ ! -d "$@" ] && curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh | sh /dev/stdin $@ || true
