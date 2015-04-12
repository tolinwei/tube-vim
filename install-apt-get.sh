#!/bin/bash
echo "
###########################################################################
## Seting up advanced shell environment from within this repo
## Please install git using the following command in order to clone this repo
##
## sudo apt-get update
## sudo apt-get upgrade
## sudo apt-get install git
##
###########################################################################"

echo "
###########################################################################
## Defining folder variables
###########################################################################"
PROJECT_FOLDER=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
DOWNLOAD_FOLDER=~/Downloads/
VIM_COLOR_FOLDER=~/.vim/colors/
ZSH_THEME_FOLDER=~/.oh-my-zsh/themes/

echo "
###########################################################################
## Installing Command Line Tools for Debian, Ubuntu, Linux Mint and etc.
###########################################################################"
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install build-essential

echo "
###########################################################################
## Backing up existing Vim settings if any
###########################################################################"
if [ -e .vimrc ]; then mv .vimrc .vimrc_bak; fi
if [ -e .vim ]; then mv .vim .vim_bak; fi

echo "
###########################################################################
## Setting up directories
###########################################################################"
cd ~/
mkdir -p $DOWNLOAD_FOLDER

echo "
###########################################################################
## Copying configuration files for tmux, bash, zhs and coloe scheme for Vim
###########################################################################"
cd $PROJECT_FOLDER
cp tmux.conf ~/.tmux.conf
cat bashrc >> ~/.bashrc
mkdir -p $VIM_COLOR_FOLDER
cp gruvbox.vim $VIM_COLOR_FOLDER
cp zshrc ~/.zshrc

echo "
###########################################################################
## Installing Vim 7.4 compiled from source code
###########################################################################"
cd $DOWNLOAD_FOLDER
wget ftp://ftp.vim.org/pub/vim/unix/vim-7.4.tar.bz2
tar jxf vim-7.4.tar.bz2
cd vim74/
./configure --with-features=huge
make && sudo make install

echo "
###########################################################################
## Installing Exuberant Ctags to support tagbar from source code
###########################################################################"
cd $DOWNLOAD_FOLDER
wget http://prdownloads.sourceforge.net/ctags/ctags-5.8.tar.gz
tar zxf ctags-5.8.tar.gz
cd ctags-5.8
./configure
make && sudo make install

echo "
###########################################################################
## Installing oh-my-zsh, may need to mannually shell change later
###########################################################################"
wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O - | sh

echo "
###########################################################################
## Installing Vundle for manegement of Vim plugins
###########################################################################"
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo "
###########################################################################
## Installing Vim plugins defined in vimrc
###########################################################################"
cd $PROJECT_FOLDER
cp vimrc ~/.vimrc
vim +PluginInstall +qall

echo "
###########################################################################
## Installing libevent as dependency of tmux
###########################################################################"
cd $DOWNLOAD_FOLDER
wget https://sourceforge.net/projects/levent/files/libevent/libevent-2.0/libevent-2.0.22-stable.tar.gz
tar zxf libevent-2.0.22-stable.tar.gz
cd libevent-2.0.22-stable/
./configure --prefix=/usr/local/
make && sudo make install  # sudo required

echo "
###########################################################################
## Installing tmux compiled from source code
###########################################################################"
cd $DOWNLOAD_FOLDER
wget http://downloads.sourceforge.net/tmux/tmux-1.9a.tar.gz
tar zxf tmux-1.9a.tar.gz
cd tmux-1.9a
./configure -LDFLAGS="-L/usr/local/lib -Wl,-rpath=/usr/local/lib" -prefix=/usr/local
make && sudo make install  # sudo required

echo "
###########################################################################
## Installing vimcat
###########################################################################"
cd $DOWNLOAD_FOLDER
git clone git://github.com/rkitover/vimpager
cd vimpager
sudo make install

