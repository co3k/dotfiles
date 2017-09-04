BASE_PATH=$(shell pwd)

all: sudo_v brew-package-install mas-install app-install dot-files-install vim-bundle-install ~/Pictures/kioku ~/Pictures/ebihara-150x150.jpg config-defaults
dot-files-install: ~/.gitconfig ~/.gitignore ~/.vimrc ~/.zshrc ~/.ctags ~/.config/karabiner/karabiner.json
app-install: /Applications/MacVim.app /Applications/Firefox.app /Applications/Karabiner-Elements.app
config-defaults: disable-boot-sound disable-menubar-transparency scroll-direction-natural configure-dock configure-screen-saver configure-hot-keys configure-terminal configure-accessibility

sudo_v:
	sudo -v

/usr/local/bin/brew:
	/usr/bin/ruby -e "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

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
#	mas upgrade

_gitconfig:
	@echo "You should configure your _gitconfig before execute. See CLEAN_INSTALL.OSX.rst"
	exit 1

~/.gitconfig: _gitconfig
	ln -s $(BASE_PATH)/_gitconfig ~/.gitconfig

~/.gitignore:
	ln -s $(BASE_PATH)/_gitignore ~/.gitignore

~/.vim/after/ftplugin:
	mkdir -p ~/.vim/after
	ln -s $(BASE_PATH)/.vim/after/ftplugin ~/.vim/after/ftplugin

~/.vim/bundle/vundle:
	mkdir -p ~/.vim/bundle
	git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

~/.config/karabiner/karabiner.json:
	mkdir -p ~/.config/karabiner/
	ln -s $(BASE_PATH)/karabiner.json ~/.config/karabiner/karabiner.json

~/.%:
	ln -s $(BASE_PATH)/$(shell basename $@) $@

~/Pictures/kioku:
	ln -s $(BASE_PATH)/pictures/kioku ~/Pictures/kioku

~/Pictures/ebihara-150x150.jpg:
	ln -s $(BASE_PATH)/pictures/ebihara-150x150.jpg ~/Pictures/ebihara-150x150.jpg

/Applications/MacVim.app:
	curl -L https://github.com/$(shell curl -L 'https://github.com/splhack/macvim-kaoriya/releases/latest' | grep -o '/splhack/macvim-kaoriya/releases/download/.*/.*\.dmg') > /tmp/macvim-kaoriya.dmg
	hdiutil attach /tmp/macvim-kaoriya.dmg
	rm -rf /Applications/MacVim.app
	cp -r /Volumes/MacVim*/MacVim.app /Applications/
	hdiutil detach /Volumes/MacVim*
	rm /tmp/macvim-kaoriya.dmg

/Applications/Firefox.app:
	curl -L "$(shell curl 'https://www.mozilla.org/ja/firefox/channel/desktop/' | grep -o 'https://download.mozilla.org/?product=firefox-[0-9]*.[0-9]b.*-SSL&amp;os=osx&amp;lang=ja-JP-mac' | sed 's/\&amp;/\&/g' | head -n1)" > /tmp/firefox.dmg
	hdiutil attach /tmp/firefox.dmg
	rm -rf /Applications/Firefox.app
	cp -r /Volumes/Firefox/Firefox.app /Applications/
	hdiutil detach /Volumes/Firefox
	rm /tmp/firefox.dmg

/Applications/Karabiner-Elements.app:
	curl -L "https://pqrs.org/latest/karabiner-elements-latest.dmg" > /tmp/karabiner-elements.dmg
	hdiutil attach /tmp/karabiner-elements.dmg
	export KARABINER_PATH="$(shell ls /Volumes/Karabiner-Elements*/Karabiner-Elements*.pkg | head -n1)" && sudo installer -pkg $$KARABINER_PATH -target /
	hdiutil detach /Volumes/Karabiner-Elements*
	rm /tmp/karabiner-elements.dmg

vim-bundle-install: ~/.vim/after/ftplugin ~/.vim/bundle/vundle
	vim +BundleInstall +qall

# The followings are OSX / macOS specific tasks.
# Special Thanks to:
#   - http://www.learningosx.com/101-ways-to-tweak-os-x-using-terminal/
#   - http://www.defaults-write.com/
#   - https://github.com/mathiasbynens/dotfiles/blob/master/.osx
#   - https://gist.github.com/woowee/6414643/raw/f7e557b9bba8bf8d889b30a3b45079a2a7bbf171/osx.sh
#   - https://github.com/netj/dotfiles/blob/master/Mac/Tweak.sh
#   - https://github.com/robb/.dotfiles/blob/master/alfred/settings.install

disable-boot-sound:
	sudo nvram SystemAudioVolume=" "

disable-menubar-transparency:
	defaults write -g AppleEnableMenuBarTransparency -bool false

scroll-direction-natural:
	# Trackpad config
	# disable "Scroll & Zoom" -> "Scroll direction: natural"
	defaults write -g com.apple.swipescrolldirection -bool false

configure-dock:
	# enable "Application Expose"
	defaults write com.apple.dock showAppExposeGestureEnabled -bool true
	# enable Hot Corner to show screensaver ...
	defaults write com.apple.dock "wvous-tl-corner" -int 5
	defaults write com.apple.dock "wvous-tl-modifier" -int 1048576
	# remove all persistent applications from Dock
	defaults write com.apple.dock "persistent-apps" -array
	defaults write com.apple.dock "autohide" -bool true
	defaults write com.apple.dock "magnification" -bool true
	defaults write com.apple.dock "orientation" "right"

configure-screen-saver:
	# Screen Saver config
	#   (But our company disables this configuration. FXXK!!!)
	defaults write com.apple.screensaver askForPassword -bool true
	defaults write com.apple.screensaver askForPasswordDelay 0
	defaults write com.apple.screensaver idleTime 0

configure-hot-keys:
	# Hot Keys config
	defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 60 '{ enabled = 1; value = { parameters = ( 65535, 105, 0 ); type = standard; }; }'

configure-terminal:
	# config Terminal
	open ./co3k-Pro.terminal
	sleep 1
	defaults write com.apple.Terminal "Default Window Settings" "co3k-Pro"
	defaults write com.apple.Terminal "Startup Window Settings" "co3k-Pro"

configure-accessibility:
	# config Accessibility
	echo -n 'a' | sudo tee /private/var/db/.AccessibilityAPIEnabled > /dev/null 2>&1
	sudo chmod 444 /private/var/db/.AccessibilityAPIEnabled
	defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true
	defaults write com.apple.universalaccess HIDScrollZoomModifierMask -int 262144
