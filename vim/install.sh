
# Install spf13
#~/.dotfiles/install/spf13-vim


mkdir ~/.vim
mkdir ~/.vim/tmp
mkdir ~/.vim/tmp/backup/
mkdir ~/.vim/tmp/swap/
mkdir ~/.vim/tmp/undo/

mkdir ~/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/vundle
vim +PluginInstall +qall
