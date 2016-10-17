#!/usr/bin/env bash

rm ~/.vim -rf

vim_dotfiles=(~/.vimrc ~/.gvimrc \
    ~/.vimrc{.fork,.spf13,.before,.bundles}{,.fork,.spf13} \
    ~/.ycm_extra_conf.py
)

for f in ${vim_dotfiles[@]}; do
    [ -L $f ] && unlink $f
done

