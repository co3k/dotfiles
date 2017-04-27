BASE_PATH=$(shell pwd)

all: brew-package-install mas-install dot-files-install

/usr/local/bin/brew:
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew-update: /usr/local/bin/brew
	brew update

brew-package-install: brew-update
	-brew install awscli
	-brew install carthage
	-brew install casperjs
	-brew install clang-format
	-brew install ctags
	-brew install glide
	-brew install go
	-brew install hub
	-brew install jq
	-brew install mas
	-brew install mitmproxy
	-brew install nkf
	-brew install nmap
	-brew install nvm
	-brew install rbenv
	-brew install rust
	-brew install swiftlint
	-brew install terminal-notifier
	-brew install the_silver_searcher
	-brew install wine
	-brew install zsh-completions
	-brew install zsh-syntax-highlighting

mas-install: brew-package-install
	mas install 497799835 # Xcode
	mas install 715768417 # Microsoft Remote Desktop
	mas install 711830901 # OmniGraffle
	mas install 428834068 # 夜フクロウ
	mas install 803453959 # Slack
	mas install 539883307 # LINE
	mas install 409183694 # Keynote
	mas upgrade

_gitconfig:
	@echo "You should configure your _gitconfig before execute. See CLEAN_INSTALL.OSX.rst"
	exit 1

~/.gitconfig: _gitconfig
	ln -s $(BASE_PATH)/_gitconfig ~/.gitconfig

~/.gitignore:
	ln -s $(BASE_PATH)/_gitignore ~/.gitignore

~/.%:
	ln -s $(BASE_PATH)/$(shell basename $@) $@

dot-files-install: ~/.gitconfig ~/.gitignore ~/.vimrc ~/.zshrc ~/.ctags
