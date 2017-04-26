/usr/local/bin/brew:
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew-update: /usr/local/bin/brew
	brew update

mac: brew-update
