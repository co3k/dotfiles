#!/bin/sh -x

keyremap4macbook=/Applications/KeyRemap4MacBook.app/Contents/Applications/KeyRemap4MacBook_cli.app/Contents/MacOS/KeyRemap4MacBook_cli

# Special Thanks to:
#   - http://www.learningosx.com/101-ways-to-tweak-os-x-using-terminal/
#   - http://www.defaults-write.com/
#   - https://github.com/mathiasbynens/dotfiles/blob/master/.osx
#   - https://gist.github.com/woowee/6414643/raw/f7e557b9bba8bf8d889b30a3b45079a2a7bbf171/osx.sh

sudo -v

# Set computer name
# TODO : use variables
sudo scutil --set ComputerName "ebisen"
sudo scutil --set LocalHostName "ebisen"

# Disable the sound effects on boot
sudo nvram SystemAudioVolume=" "

# Menu bar: disable transparency
defaults write -g AppleEnableMenuBarTransparency -bool false

# Trackpad config
defaults write -g com.apple.swipescrolldirection 0  # disable "Scroll & Zoom" -> "Scroll direction: natural"

# Dock config
defaults write com.apple.dock showAppExposeGestureEnabled 1 # enable "Application Expose"
defaults write com.apple.dock "wvous-tl-corner" 5 # enable Hot Corner to show screensaver ...
defaults write com.apple.dock "wvous-tl-modifier" 1048576 # ... with command key
defaults write com.apple.dock "persistent-apps" -array # remove all persistent applications from Dock
defaults write com.apple.dock "autohide" 1
defaults write com.apple.dock "magnification" 1
defaults write com.apple.dock "orientation" "right"

# Screen Saver config
defaults write com.apple.screensaver askForPassword 1

# Hot Keys config
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 60 '{ enabled = 0; value = { parameters = ( 32, 49, 1048576 ); type = standard; }; }'

# Firewall config
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setglobalstate on

# Screen Capture config
defaults write com.apple.screencapture type -string “png”
defaults write com.apple.screencapture location -string “$HOME/Pictures/capture”

# config KeyRemap4MacBook
$keyremap4macbook set remap.jis_eisuu2escape 1
$keyremap4macbook set remap.f6_to_virtual_numlock 1
$keyremap4macbook set remap.jis_unify_eisuu_to_kana 1

# config Alfred v2
defaults write com.runningwithcrayons.Alfred-Preferences 'appearance.theme' 'alfred.theme.pistachio'
defaults write com.runningwithcrayons.Alfred-Preferences 'hotkey.default' -array '{ key = 49; mod = 1048576; string = Space; }'
defaults write ~/Library/Application\ Support/Alfred\ 2/Alfred.alfredpreferences/preferences/features/defaultresults/prefs showAll 1

# config Terminal
open ./co3k-Pro.terminal
defaults write com.apple.Terminal "Default Window Settings" "co3k-Pro"
defaults write com.apple.Terminal "Startup Window Settings" "co3k-Pro"

# change to use Homebrew zsh
sudo perl -i -ple 'print "/usr/local/bin/zsh" if eof' /etc/shells
chpass -s /usr/local/bin/zsh

# change to use Homebrew apache
mkdir -p ~/Library/LaunchAgents
ln -sfv /usr/local/opt/httpd/homebrew.mxcl.httpd.plist ~/Library/LaunchAgents/homebrew.mxcl.httpd.plist
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.httpd.plist
