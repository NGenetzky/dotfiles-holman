set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.dotfiles/vim/bundle/Vundle.vim

"call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
call vundle#begin('~/.dotfiles/vim/bundle') 

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.
" --- Plugins ---

Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-obsession'
"Plugin 'tpope/sensible.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'

Plugin 'christoomey/vim-tmux-navigator'

Plugin 'ctrlpvim/ctrlp.vim'

Plugin 'tomtom/tcomment_vim'

" The Most Recently Used (MRU) plugin provides an easy access to a list of
" recently opened/edited files in Vim.
Plugin 'yegappan/mru'

" A light and configurable statusline/tabline for Vim.
Plugin 'itchyny/lightline.vim'

" Disabled since I dont have Exuberant ctags 5.5
" Plugin 'majutsushi/tagbar'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
