#!/bin/sh -x

keyremap4macbook=/Applications/KeyRemap4MacBook.app/Contents/Applications/KeyRemap4MacBook_cli.app/Contents/MacOS/KeyRemap4MacBook_cli

# Special Thanks to:
#   - http://www.learningosx.com/101-ways-to-tweak-os-x-using-terminal/
#   - http://www.defaults-write.com/
#   - https://github.com/mathiasbynens/dotfiles/blob/master/.osx
#   - https://gist.github.com/woowee/6414643/raw/f7e557b9bba8bf8d889b30a3b45079a2a7bbf171/osx.sh
#   - https://github.com/netj/dotfiles/blob/master/Mac/Tweak.sh
#   - https://github.com/robb/.dotfiles/blob/master/alfred/settings.install

sudo -v

# Set computer name
if [ $COMPUTER_NAME ] ; then
    sudo scutil --set ComputerName $COMPUTER_NAME
    sudo scutil --set LocalHostName $COMPUTER_NAME
fi

# Disable the sound effects on boot
sudo nvram SystemAudioVolume=" "

# Menu bar: disable transparency
defaults write -g AppleEnableMenuBarTransparency -bool false

# Trackpad config
# disable "Scroll & Zoom" -> "Scroll direction: natural"
defaults write -g com.apple.swipescrolldirection -bool false

# Dock config
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

# Screen Saver config
defaults write com.apple.screensaver askForPassword -bool true
defaults write com.apple.screensaver askForPasswordDelay 0
defaults write com.apple.screensaver idleTime 0
defaults write com.apple.screensaver moduleDict '{ moduleName = iLifeSlideshows; path = "/System/Library/Frameworks/ScreenSaver.framework/Resources/iLifeSlideshows.saver"; type=0; }'
defaults write -currentHost com.apple.screensaver moduleDict '{ moduleName = iLifeSlideshows; path = "/System/Library/Frameworks/ScreenSaver.framework/Resources/iLifeSlideshows.saver"; type=0; }'

# Hot Keys config
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 60 '{ enabled = 0; value = { parameters = ( 32, 49, 1048576 ); type = standard; }; }'

# Firewall config
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setglobalstate on

# Screen Capture config
defaults write com.apple.screencapture type -string "png"
defaults write com.apple.screencapture location -string "$HOME/Pictures/capture"

# config KeyRemap4MacBook
$keyremap4macbook set remap.jis_eisuu2escape 1
$keyremap4macbook set remap.f6_to_virtual_numlock 1
$keyremap4macbook set remap.jis_unify_eisuu_to_kana 1

# config Alfred v2
defaults write com.runningwithcrayons.Alfred-Preferences 'appearance.theme' 'alfred.theme.pistachio'
defaults write com.runningwithcrayons.Alfred-Preferences hotkey.default -dict key -int 49 mod -int 1048576 string Space
defaults write ~/Library/Application\ Support/Alfred\ 2/Alfred.alfredpreferences/preferences/features/defaultresults/prefs showAll 1

# config Terminal
open ./co3k-Pro.terminal
sleep 1
defaults write com.apple.Terminal "Default Window Settings" "co3k-Pro"
defaults write com.apple.Terminal "Startup Window Settings" "co3k-Pro"

# change to use Homebrew zsh
sudo perl -i -ple 'print "/usr/local/bin/zsh" if eof' /etc/shells
chpass -s /usr/local/bin/zsh

# change to use Homebrew apache
mkdir -p ~/Library/LaunchAgents
ln -sfv /usr/local/opt/httpd/homebrew.mxcl.httpd.plist ~/Library/LaunchAgents/homebrew.mxcl.httpd.plist
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.httpd.plist

# config Accessibility
echo -n 'a' | sudo tee /private/var/db/.AccessibilityAPIEnabled > /dev/null 2>&1
sudo chmod 444 /private/var/db/.AccessibilityAPIEnabled
defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true
defaults write com.apple.universalaccess HIDScrollZoomModifierMask -int 262144

# ...
defaults write com.apple.BezelServices kDim -bool false
defaults write com.apple.dashboard mcx-disabled -bool true
