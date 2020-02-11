include ../makefiles/environments.mk

PREINSTALL_DARWIN := install-firefox-developer-edition

include ${ROOT}/makefiles/commons.mk

install-firefox-developer-edition:
	ls /Applications | grep -q Firefox \
		|| brew cask install homebrew/cask-versions/firefox-developer-edition

