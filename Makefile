all:

/usr/local/bin/brew:
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew-update: /usr/local/bin/brew
	brew update

package-install: brew-update
	brew install nvm
	brew install jq

mac: package-install
