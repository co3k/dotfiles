#!/bin/sh -x

if [ ! -e _gitconfig ]; then
    echo "You must modify _gitconfig.example as _gitconfig before execute this script"
    exit 1
fi

export BASE_PATH=`pwd`

ln -s $BASE_PATH/.brew ~/.brew
cd ~/.brew
brew bundle

ln -s $BASE_PATH/.vimrc ~/.vimrc
ln -s $BASE_PATH/.vimperatorrc ~/.vimperatorrc
ln -s $BASE_PATH/.zshrc ~/.zshrc
ln -s $BASE_PATH/_gitconfig ~/.gitconfig
ln -s $BASE_PATH/_gitignore ~/.gitignore

mkdir -p ~/.vim/after/ftplugin
ln -s $BASE_PATH/.vim/after/ftplugin ~/.vim/after/ftplugin

mkdir -p ~/.vim/bundle
cd ~/.vim/bundle
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
vi +BundleInstall +qall
