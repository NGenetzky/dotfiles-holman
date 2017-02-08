#!/bin/bash

## In use in HOME/.vim/

# Temporary files
# dir="$HOME/.vim/backup" && [ -d $dir ] && rm $dir -r
dir="$HOME/.vim/swap" && [ -d $dir ] && rm $dir -r
dir="$HOME/.vim/views" && [ -d $dir ] && rm $dir -r
# dir="$HOME/.vim/undo" && [ -d $dir ] && rm $dir -r

file="$HOME/.vim/info" && [ -f $file ] && rm $file

## Old in HOME/.vim/
dir="$HOME/.vim/tmp" && [ -d $dir ] && rm $dir -r
dir="$HOME/.vim/vimbackup" && [ -d $dir ] && rm $dir -r
dir="$HOME/.vim/vimswap" && [ -d $dir ] && rm $dir -r
dir="$HOME/.vim/vimundo" && [ -d $dir ] && rm $dir -r
dir="$HOME/.vim/vimviews" && [ -d $dir ] && rm $dir -r

file="$HOME/.vim/viminfo" && [ -f $file ] && rm $file

## Old in HOME/
dir="$HOME/.vimbackup" && [ -d $dir ] && rm $dir -r
dir="$HOME/.vimswap" && [ -d $dir ] && rm $dir -r
dir="$HOME/.vimundo" && [ -d $dir ] && rm $dir -r

file="$HOME/.vim-bookmarks" && [ -f $file ] && rm $file
file="$HOME/.viminfo" && [ -f $file ] && rm $file
