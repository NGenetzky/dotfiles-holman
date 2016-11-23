#!/usr/bin/env bash

vim_dotfiles=( \
    vimrc gvimrc \
    *.vim \
    vimrc{.fork,.spf13,.before,.bundles}{,.fork,.spf13} \
    ycm_extra_conf.py
)

for f in ${vim_dotfiles[@]}; do
    in_home="$HOME/.$f"
    in_vim="$HOME/.vim/$f"
    [ -L $in_home ] && unlink $in_home
    [ -L $in_vim ] && unlink $in_vim
done

