#!/bin/bash
echo "
################################################################################
##       _         _                     _
##      | |_ _   _| |__   ___     __   _(_)_ __ ___
##      | __| | | | '_ \\ / _ \\____\\ \\ / / | '_ \` _ \\
##      | |_| |_| | |_) |  __/_____\\ V /| | | | | | |
##       \\__|\\__,_|_.__/ \\___|      \\_/ |_|_| |_| |_|
##
################################################################################"

echo "
################################################################################
## Seting up advanced Shell environment from within this repo
## Strongly recommend to install iTerm2 before executing this script
################################################################################"

echo "
################################################################################
## Defining directory variables
################################################################################"
HOME_DIR=~
PROJECT_DIR=${HOME_DIR}/.tube-vim/
DOWNLOAD_DIR=${HOME_DIR}/Downloads/
VIM_COLOR_DIR=${HOME_DIR}/.vim/colors/
ZSH_THEME_DIR=${HOME_DIR}/.oh-my-zsh/themes/

echo "
################################################################################
## Installing brew, git, wget for OS X if miss any
################################################################################"
which -s brew
if [[ $? != 0 ]] ; then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    brew update
    brew upgrade
fi
which -s git || brew install git

echo "
################################################################################
## Cloning repo to home directories (must be after git installation)
################################################################################"
rm -rf $PROJECT_DIR
git clone https://github.com/tolinwei/tube-vim.git $PROJECT_DIR

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
cd $HOME_DIR
current_time=`date +"%y-%m-%d-%H:%M"`
if [ -e .vimrc ] ; then
    mv .vimrc .vimrc.bak-${current_time}
fi
if [ -d .vim ] ; then
    mv .vim .vim.bak-${current_time}
fi
if [ -e .screenrc ] ; then
    mv .screen .screenrc.bak-${current_time}
fi
if [ -e .tmux.conf ] ; then
    mv .tmux.conf .tmux.conf.bak-${current_time}
fi

echo "
################################################################################
## Setting up directories
################################################################################"
cd $HOME_DIR
mkdir -p $DOWNLOAD_DIR

echo "
################################################################################
## Copying configuration files for bash, zhs and coloe scheme for Vim
################################################################################"
cd $PROJECT_DIR
cat bashrc >> ${HOME_DIR}/.bashrc
mkdir -p $VIM_COLOR_DIR
cp gruvbox.vim $VIM_COLOR_DIR
cp zshrc ${HOME_DIR}/.zshrc

echo "
################################################################################
## Installing Vim 7.4 from brew
## https://github.com/Homebrew/homebrew/blob/master/Library/Formula/vim.rb
## Needs to restart shell session to make installation works
################################################################################"
#brew install macvim --with-lua
#brew linkapps macvim

brew install vim
brew install tmux

echo "
################################################################################
## Installing Exuberant Ctags to support tagbar from source code
################################################################################"
CTAGS_DIR=`which ctags`
if [ $CTAGS_DIR != '/usr/local/bin/ctags' ] ; then
    cd $DOWNLOAD_DIR
    curl -L http://prdownloads.sourceforge.net/ctags/ctags-5.8.tar.gz
    tar zxf ctags-5.8.tar.gz
    cd ctags-5.8
    ./configure -prefix=/usr/local
    make && sudo make install
fi

echo "
################################################################################
## Installing oh-my-zsh, may need to mannually change shell later
################################################################################"
if [ ! -d ${HOME_DIR}/.oh-my-zsh ]; then
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

echo "
################################################################################
## Installing Vundle for manegement of Vim plugins
################################################################################"
if [ ! -d ${HOME_DIR}/.vim/bundle/Vundle.vim ] ; then
    git clone https://github.com/gmarik/Vundle.vim.git ${HOME_DIR}/.vim/bundle/Vundle.vim
fi

echo "
################################################################################
## Installing Vim plugins defined in vimrc
################################################################################"
cd $PROJECT_DIR
cp vimrc ${HOME_DIR}/.vimrc
vim +PluginInstall +qa

echo "
################################################################################
## Installing cmake, then compile YouCompleteMe
################################################################################"
brew install cmake
cd $HOME_DIR/.vim/bundle/YouCompleteMe
./install.sh --clang-completer \
             --omnisharp-completer \
             --gocode-completer

echo "
################################################################################
## Importing color scheme for iTerm2 and terminal
## Please click 'OK' on the popup window
################################################################################"
cd $PROJECT_DIR
open gruvbox-dark.itermcolors
open gruvbox-dark.terminal
open gruvbox-light.itermcolors
open gruvbox-light.terminal

echo "
################################################################################
## Finish installation!!
## Please enjoy --------
################################################################################
##       _         _                     _
##      | |_ _   _| |__   ___     __   _(_)_ __ ___
##      | __| | | | '_ \\ / _ \\____\\ \\ / / | '_ \` _ \\
##      | |_| |_| | |_) |  __/_____\\ V /| | | | | | |
##       \\__|\\__,_|_.__/ \\___|      \\_/ |_|_| |_| |_|
##
################################################################################"

