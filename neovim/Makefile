include ../makefiles/environments.mk

TARGETS := \
	${XDG_CONFIG_HOME}/nvim/init.vim \
	${XDG_CONFIG_HOME}/nvim/dein.vim

EXTRA_TARGETS := \
	${XDG_CONFIG_HOME}/nvim

INSTALLER_URL := https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh

include ${ROOT}/makefiles/commons.mk

${XDG_CONFIG_HOME}/nvim: 
	mkdir -p $@

${XDG_CONFIG_HOME}/nvim/init.vim: ${CWD}/init.vim ${XDG_CONFIG_HOME}/nvim
	ln -sf $< $@

${XDG_CONFIG_HOME}/nvim/dein.vim: ${XDG_CONFIG_HOME}/nvim
	curl ${INSTALLER_URL} | sh /dev/stdin $@
