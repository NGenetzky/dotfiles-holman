#!/usr/bin/env bash

# vimproc.vim
if [ -d ~/.vim/bundle/vimproc.vim ]; then
    # Error if make is not installed.
    ( cd ~/.vim/bundle/vimproc.vim/ && make )
fi
