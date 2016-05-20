#!/usr/bin/env bash

# Link resource files to the configured versions
cd ~
ln -s .vim/vimrc .vimrc
ln -s .vim/gvimrc .gvimrc
ln -s .vim/pylintrc .pylintrc

# Update/Install the submodule plugins
cd ~/.vim
git submodule update --init
