#!/usr/bin/env bash

mkdir -p ~/.vim/bundle
if [ ! -d ~/.vim/bundle/vundle ]; then
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/vundle
fi
vim +PluginInstall +qall

# vimproc.vim
if [ -d ~/.vim/bundle/vimproc.vim ]; then
    ( cd ~/.vim/bundle/vimproc.vim/ && make )
fi
