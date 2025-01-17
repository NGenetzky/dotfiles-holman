#!/usr/bin/env bash

vim_dotfiles=( \
    vimrc gvimrc \
    *.vim \
    vimrc{.fork,.spf13,.before,.bundles}{,.fork,.spf13} \
    ycm_extra_conf.py
)

for f in ${vim_dotfiles[@]}; do
    in_home="$HOME/.$f"
    [ -L $in_home ] && unlink $in_home
    in_vim="$HOME/.vim/$f"
    [ -L "$in_vim" ] && unlink "$in_vim"
done

# Old:
dir="$HOME/.vimbackup" && [ -d $dir ] && rm $dir -r
dir="$HOME/.vimswap" && [ -d $dir ] && rm $dir -r
dir="$HOME/.vimundo" && [ -d $dir ] && rm $dir -r
file="$HOME/.vim-bookmarks" && [ -f $file ] && rm $file
file="$HOME/.viminfo" && [ -f $file ] && rm $file

