include ../makefiles/environments.mk

DEPENDENCIES_DARWIN := homebrew
PREINSTALL_DARWIN := code

include ${ROOT}/makefiles/commons.mk

# refs: https://stackoverflow.com/questions/58457958/visual-studio-code-cant-be-opened-because-apple-cannot-check-it-for-malicious
.PHONY: code 
code:
	which -s code \
		|| brew cask install visual-studio-code
	xattr -d com.apple.quarantine /Applications/Visual\ Studio\ Code.app


