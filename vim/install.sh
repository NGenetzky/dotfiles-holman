#!/usr/bin/env bash

source $DOTFILES/install/spf13-vim-partial

mkdir -p ~/.vim/bundle
if [ ! -d ~/.vim/bundle/vundle ]; then
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/vundle
fi
vim +PluginInstall +qall
