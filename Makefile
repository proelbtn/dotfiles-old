# ==============================================================================

.SILENT:

# ==============================================================================

PWD = $(shell pwd)

# TODO: load environment variable
XDG_CONFIG_DIR = $(HOME)/.config

# ==============================================================================

FG_BLACK 	= $$(printf "\e[30m")
FG_RED 		= $$(printf "\e[31m")
FG_GREEN 	= $$(printf "\e[32m")
FG_YELLOW 	= $$(printf "\e[33m")
FG_BLUE 	= $$(printf "\e[34m")
FG_MAGENTA	= $$(printf "\e[35m")
FG_CYAN 	= $$(printf "\e[36m")
FG_WHITE 	= $$(printf "\e[37m")
FG_RESET 	= $$(printf "\e[39m")

BG_BLACK 	= $$(printf "\e[40m")
BG_RED 		= $$(printf "\e[41m")
BG_GREEN 	= $$(printf "\e[42m")
BG_YELLOW 	= $$(printf "\e[43m")
BG_BLUE 	= $$(printf "\e[44m")
BG_MAGENTA	= $$(printf "\e[45m")
BG_CYAN 	= $$(printf "\e[46m")
BG_WHITE 	= $$(printf "\e[47m")
BG_RESET 	= $$(printf "\e[49m")

SUCCESS	= echo "$(FG_GREEN)==>$(FG_RESET)"
FAILED 	= echo "$(FG_RED)==>$(FG_RESET)"
WARNING	= echo "$(FG_YELLOW)==>$(FG_RESET)"
INFO	= echo "$(FG_BLUE)==>$(FG_RESET)"

SILENT_OUT	= > /dev/null
SILENT_ERR	= 2> /dev/null
SILENT_ALL	= $(SILENT_OUT) $(SILENT_ERR)

# ==============================================================================

all: motd install

# ==============================================================================

motd:
	echo
	echo "$(FG_YELLOW) ########   #######  ######## ######## #### ##       ########  ###### " 
	echo "$(FG_YELLOW) ##     ## ##     ##    ##    ##        ##  ##       ##       ##    ##" 
	echo "$(FG_YELLOW) ##     ## ##     ##    ##    ##        ##  ##       ##       ##      " 
	echo "$(FG_YELLOW) ##     ## ##     ##    ##    ######    ##  ##       ######    ###### " 
	echo "$(FG_YELLOW) ##     ## ##     ##    ##    ##        ##  ##       ##             ##" 
	echo "$(FG_YELLOW) ##     ## ##     ##    ##    ##        ##  ##       ##       ##    ##" 
	echo "$(FG_YELLOW) ########   #######     ##    ##       #### ######## ########  ###### " 
	echo

# ==============================================================================

install: install/zsh install/nvim install/git install/tmux
	$(SUCCESS) completed installation

# ==============================================================================

install/zsh: ensure/XDG_CONFIG_DIR install/zsh-syntax-highlighting
	$(INFO) installing zsh
	ln -sf "$(PWD)/src/zsh/loader.zsh" "$(HOME)/.zshrc"
	mkdir -p "$(XDG_CONFIG_DIR)/zsh/sources"
	ln -sf "$(PWD)/src/zsh/master.zsh" "$(XDG_CONFIG_DIR)/zsh/sources/00_master.zsh"
	$(SUCCESS) installed zsh

# ==============================================================================

URL_ZSH_SYNTAX_HIGHLIGHTING = "https://github.com/zsh-users/zsh-syntax-highlighting.git"

install/zsh-syntax-highlighting: ensure/XDG_CONFIG_DIR
	[[ ! -d "$(XDG_CONFIG_DIR)/zsh/highlighting" ]] \
		&& git clone --depth=1 $(URL_ZSH_SYNTAX_HIGHLIGHTING) "$(XDG_CONFIG_DIR)/zsh/highlighting"  \
		|| true

# ==============================================================================

install/nvim: ensure/XDG_CONFIG_DIR install/dein.vim
	$(INFO) installing nvim
	ln -sf "$(PWD)/src/nvim/init.vim" "$(XDG_CONFIG_DIR)/nvim/init.vim" 
	$(SUCCESS) installed nvim

# ==============================================================================

URL_DEIN_VIM = "https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh"

# TODO: try to download with curl and wget
# dein.vim is installed in ~/.config/nvim/dein.vim
install/dein.vim:
	$(INFO) installing dein.vim
	curl $(URL_DEIN_VIM) | sh /dev/stdin "$(XDG_CONFIG_DIR)/nvim/dein.vim" $(SILENT_ALL)
	$(SUCCESS) installed dein.vim

# ==============================================================================

install/git:
	$(INFO) installing git
	ln -sf "$(PWD)/src/git/config" "$(HOME)/.gitconfig"
	$(SUCCESS) installed git

# ==============================================================================

install/tmux:
	$(INFO) installing tmux
	ln -sf "$(PWD)/src/tmux/config" "$(HOME)/.tmux.conf"
	$(SUCCESS) installed tmux

# ==============================================================================

ensure/XDG_CONFIG_DIR:
	$(INFO) checking "$(XDG_CONFIG_DIR)"
	mkdir -p "$(XDG_CONFIG_DIR)"
