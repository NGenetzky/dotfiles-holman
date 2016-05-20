## vim-config

This holds my vim/gvim configuration.

## Installation
* Clone the repo into ```~/.vim```
```
git clone <repo> ~/.vim
```
* Link resource files to the configured versions
```
cd ~
ln -s .vim/vimrc .vimrc
ln -s .vim/gvimrc .gvimrc
ln -s .vim/pylintrc .pylintrc
```
* Update/Install the submodule plugins
```
cd ~/.vim
git submodule update --init
```

## Usage
* &lt;F5&gt; Will kickoff syntastic to check your syntax.
