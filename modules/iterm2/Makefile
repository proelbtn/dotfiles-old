include ../makefiles/environments.mk

DEPENDENCIES_DARWIN := homebrew
PREINSTALL_DARWIN := iterm2
PREINSTALL_LINUX := fail

TARGETS := \
	${XDG_CONFIG_HOME}/dracula

include ${ROOT}/makefiles/commons.mk

.PHONY:
iterm2:
	ls /Applications | grep iTerm -q \
		|| brew cask install iterm2

${XDG_CONFIG_HOME}/dracula:
	git clone https://github.com/dracula/iterm.git $@
	open $@/Dracula.itermcolors
