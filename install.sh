#!/bin/bash
echo "
################################################################################
##           _         _                     _
##          | |_ _   _| |__   ___     __   _(_)_ __ ___
##          | __| | | | '_ \\ / _\\____\\ \\ / / | '_ \` _ \\
##          | |_| |_| | |_) |  __/_____\\ V /| | | | | | |
##           \\__|\\__,_|_.__/ \\___|      \\_/ |_|_| |_| |_|
##
################################################################################"

echo "
################################################################################
## Seting up advanced Shell environment from within this repo
## Strongly recommend to install iTerm2 before executing this script
################################################################################"

echo "
################################################################################
## Installing brew, git, wget for OS X if miss any
################################################################################"
which -s brew
if [[ $? != 0 ]]
then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    brew update
    brew upgrade
fi
which -s git || brew install git
which -s wget || brew install wget

echo "
################################################################################
## Cloning repot to home directories
################################################################################"
rm -rf ~/.tube-vim/
git clone https://github.com/tolinwei/tube-vim.git ~/.tube-vim

echo "
################################################################################
## Defining folder variables
################################################################################"
cd ~/.tube-vim/
PROJECT_FOLDER=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
DOWNLOAD_FOLDER=~/Downloads/
VIM_COLOR_FOLDER=~/.vim/colors/
ZSH_THEME_FOLDER=~/.oh-my-zsh/themes/

echo "
################################################################################
## Installing Command Line Tools for OS X
## Please click 'Install' on the popup window
################################################################################"
xcode-select --install

echo "
################################################################################
## Backing up existing Vim settings if any
################################################################################"
cd ~/
if [ -e .vimrc ]
then
    rm -f .vimrc_bak
    mv .vimrc .vimrc_bak
fi
if [ -d .vim ]
then
    rm -rf .vim_bak
    mv .vim .vim_bak
fi

echo "
################################################################################
## Setting up directories
################################################################################"
cd ~/
mkdir -p $DOWNLOAD_FOLDER

echo "
################################################################################
## Copying configuration files for bash, zhs and coloe scheme for Vim
################################################################################"
cd $PROJECT_FOLDER
cat bashrc >> ~/.bashrc
mkdir -p $VIM_COLOR_FOLDER
cp gruvbox.vim $VIM_COLOR_FOLDER
cp zshrc ~/.zshrc

echo "
################################################################################
## Installing Vim 7.4 from brew
## https://github.com/Homebrew/homebrew/blob/master/Library/Formula/vim.rb
## Needs to restart shell session to make installation works
################################################################################"
brew install macvim --with-cscope --with-lua
brew linkapps macvim

# not sure about the directory priviledge
# looking for re-appearance of situation
#sudo chmod a+w /usr/local/include
#sudo chmod a+w /usr/local/lib/pkgconfig
#brew link lua

brew install vim --with-lua

echo "
################################################################################
## Installing Exuberant Ctags to support tagbar from source code
################################################################################"
CTAGS_DIR=`which ctags`
if [ $CTAGS_DIR != '/usr/local/bin/ctags' ]
then
    cd $DOWNLOAD_FOLDER
    wget http://prdownloads.sourceforge.net/ctags/ctags-5.8.tar.gz
    tar zxf ctags-5.8.tar.gz
    cd ctags-5.8
    ./configure -prefix=/usr/local
    make && sudo make install
fi

echo "
################################################################################
## Installing oh-my-zsh, may need to mannually change shell later
################################################################################"
if [ ! -d ~/.oh-my-zsh ]; then
    wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O - | sh
fi

echo "
################################################################################
## Installing Vundle for manegement of Vim plugins
################################################################################"
if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

echo "
################################################################################
## Installing Vim plugins defined in vimrc
################################################################################"
cd $PROJECT_FOLDER
cp vimrc ~/.vimrc
vim +PluginInstall +qall

echo "
################################################################################
## Installing vimcat
################################################################################"
cd $DOWNLOAD_FOLDER
git clone git://github.com/rkitover/vimpager
cd vimpager
sudo make install

echo "
################################################################################
## Importing color scheme for iTerm2 and terminal
## Please click 'OK' on the popup window
################################################################################"
cd $PROJECT_FOLDER
open gruvbox-dark.itermcolors
open gruvbox-dark.terminal

echo "
################################################################################
## Finish installation!!
## Please enjoy --------
################################################################################
##           _         _                     _
##          | |_ _   _| |__   ___     __   _(_)_ __ ___
##          | __| | | | '_ \\ / _\\____\\ \\ / / | '_ \` _ \\
##          | |_| |_| | |_) |  __/_____\\ V /| | | | | | |
##           \\__|\\__,_|_.__/ \\___|      \\_/ |_|_| |_| |_|
##
################################################################################"

