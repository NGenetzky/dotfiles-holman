#!/usr/bin/env bash

sudo $DOTFILES/bin/install/vim-nox

mkdir -p ~/.vim/bundle
if [ ! -d ~/.vim/bundle/vundle ]; then
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/vundle
fi
vim +PluginInstall +qall

# vimproc.vim
if [ -d ~/.vim/bundle/vimproc.vim ]; then
    # Error if make is not installed.
    ( cd ~/.vim/bundle/vimproc.vim/ && make )
fi
