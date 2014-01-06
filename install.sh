#!/bin/sh -x

if [ ! -e _gitconfig ]; then
    echo "You must modify _gitconfig.example as _gitconfig before execute this script"
    exit 1
fi

ln -s `pwd`/.vimrc ~/.vimrc
ln -s `pwd`/.vimperatorrc ~/.vimperatorrc
ln -s `pwd`/.zshrc ~/.zshrc
ln -s `pwd`/_gitconfig ~/.gitconfig
ln -s `pwd`/_gitignore ~/.gitignore

mkdir -p ~/.vim/after/ftplugin
ln -s `pwd`/.vim/after/ftplugin ~/.vim/after/ftplugin

mkdir -p ~/.vim/bundle
cd ~/.vim/bundle
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
vi +BundleInstall +qall
