#!/bin/bash
echo -e "
     _         _                     _
    | |_ _   _| |__   ___     __   _(_)_ __ ___
    | __| | | | '_ \\ / _ \\____\\ \\ / / | '_ \` _ \\
    | |_| |_| | |_) |  __/_____\\ V /| | | | | | |
     \\__|\\__,_|_.__/ \\___|      \\_/ |_|_| |_| |_|\n"

echo -e "## Seting up advanced Shell environment from within this repo...\n"

echo -e "## Defining directory variables..."
HOME_DIR=~
PROJECT_DIR=${HOME_DIR}/.tube-vim/
DOWNLOAD_DIR=${HOME_DIR}/Downloads/
VIM_COLOR_DIR=${HOME_DIR}/.vim/colors/
ZSH_THEME_DIR=${HOME_DIR}/.oh-my-zsh/themes/
echo -e "...Done\n"

echo -e "## Installing brew, git, wget for OS X if miss any..."
which -s brew
if [[ $? != 0 ]] ; then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    brew update
    brew upgrade
fi
which -s git || brew install git
echo -e "...Done\n"

echo -e "## Cloning repo to home directories..."
rm -rf $PROJECT_DIR
git clone https://github.com/tolinwei/tube-vim.git $PROJECT_DIR
echo -e "...Done\n"

echo -e "## Installing Command Line Tools for OS X (lease click 'Install' on the popup window)..."
xcode-select --install
echo -e "...Done\n"

echo -e "## Backing up existing Vim settings..."
cd $HOME_DIR
date_time=`date +"%y-%m-%d-%H:%M"`
if [ -e .vimrc ] ; then
    mv .vimrc .vimrc.bak-${date_time}
fi
if [ -d .vim ] ; then
    mv .vim .vim.bak-${date_time}
fi
if [ -e .screenrc ] ; then
    mv .screen .screenrc.bak-${date_time}
fi
if [ -e .tmux.conf ] ; then
    mv .tmux.conf .tmux.conf.bak-${date_time}
fi
echo -e "...Done\n"

echo -e "## Setting up directories..."
cd $HOME_DIR
mkdir -p $DOWNLOAD_DIR
echo -e "...Done\n"

echo -e "## Installing Vim and tmux via brew..."
## https://github.com/Homebrew/homebrew/blob/master/Library/Formula/vim.rb
## Needs to restart shell session to make installation works

#brew install macvim --with-lua
#brew linkapps macvim

brew install vim
brew install tmux
echo -e "...Done\n"

echo -e "## Installing Exuberant Ctags to support tagbar from brew..."
CTAGS_DIR=`which ctags`
if [ $CTAGS_DIR != '/usr/local/bin/ctags' ] ; then
    #cd $DOWNLOAD_DIR
    #curl -L http://prdownloads.sourceforge.net/ctags/ctags-5.8.tar.gz
    #tar zxf ctags-5.8.tar.gz
    #cd ctags-5.8
    #./configure -prefix=/usr/local
    #make && sudo make install
    brew install ctags
fi
echo -e "...Done\n"

echo -e "## Installing oh-my-zsh..."
if [ ! -d ${HOME_DIR}/.oh-my-zsh ]; then
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi
echo -e "...Done\n"

echo -e "## Copying configuration files for bash, zhs and color scheme for Vim..."
cd $HOME_DIR
if [ -e .bashrc ] ; then
    mv .bashrc .bashrc.bak-${date_time}
fi
cd $PROJECT_DIR
cat bashrc >> ${HOME_DIR}/.bashrc
mkdir -p $VIM_COLOR_DIR
cp gruvbox.vim $VIM_COLOR_DIR
cp zshrc ${HOME_DIR}/.zshrc
echo -e "...Done\n"

echo -e "## Installing Vundle for manegement of Vim plugins..."
if [ ! -d ${HOME_DIR}/.vim/bundle/Vundle.vim ] ; then
    git clone https://github.com/gmarik/Vundle.vim.git ${HOME_DIR}/.vim/bundle/Vundle.vim
fi
echo -e "...Done\n"

echo -e "## Installing Vim plugins defined in vimrc..."
cd $PROJECT_DIR
cp vimrc ${HOME_DIR}/.vimrc
vim +PluginInstall +qa
echo -e "...Done\n"

echo -e "## Installing cmake, then compile YouCompleteMe..."
brew install cmake
cd $HOME_DIR/.vim/bundle/YouCompleteMe
./install.sh --clang-completer \
             --omnisharp-completer \
             --gocode-completer
echo -e "...Done\n"

echo -e "## Importing color scheme for iTerm2 and terminal, (please click 'OK' on the popup window..."
cd $PROJECT_DIR
open gruvbox-dark.itermcolors
open gruvbox-dark.terminal
open gruvbox-light.itermcolors
open gruvbox-light.terminal
echo -e "...Done\n"

echo -e "## Finish installation, please enjoy!"
echo -e "
     _         _                     _
    | |_ _   _| |__   ___     __   _(_)_ __ ___
    | __| | | | '_ \\ / _ \\____\\ \\ / / | '_ \` _ \\
    | |_| |_| | |_) |  __/_____\\ V /| | | | | | |
     \\__|\\__,_|_.__/ \\___|      \\_/ |_|_| |_| |_|\n"

