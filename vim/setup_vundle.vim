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
Plugin 'tpope/vim-sensible'

" Conque is a Vim plugin which allows you to run interactive programs, such as
" bash on linux or powershell.exe on Windows, inside a Vim buffer.
Plugin 'vim-scripts/Conque-Shell'
" C/C++ IDE --  Write and run programs. Insert statements, idioms, comments etc. 
Plugin 'vim-scripts/c.vim'
" Zoom in/out of windows. Full screen a pane / revert to pane view.
Plugin 'vim-scripts/ZoomWin'

" Shows directory structure in pane.
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

" Shows the current tag structure in a pane.
Plugin 'majutsushi/tagbar'

" Automated tag generation and syntax highlighting in Vim
Plugin 'xolox/vim-misc' " Required for vim-easytags
Plugin 'xolox/vim-easytags'

" Snippet Engine (requires python)
Plugin 'SirVer/ultisnips'

" Snippet repo.
Plugin 'honza/vim-snippets'

" Completion Engine
Plugin 'Valloric/YouCompleteMe'

" Gundo.vim is Vim plugin to visualize your Vim undo tree.
Plugin 'sjl/gundo.vim'

" Organize/Navigate projects of files (like IDE/buffer explorer)
Plugin 'vimplugin/project.vim'

" The fancy start screen for Vim.
Plugin 'mhinz/vim-startify'

" Bookmarks
Plugin 'MattesGroeger/vim-bookmarks'

" The unite or unite.vim plug-in can search and display information from
" arbitrary sources like files, buffers, recently used files or registers.
Plugin 'Shougo/unite.vim'

" Always have a nice view for vim split windows!
Plugin 'zhaocai/GoldenView.Vim'

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
