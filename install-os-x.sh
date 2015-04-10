#!/bin/bash
################################################################################
# Setup dev env from within this repo
# Install iTerm2 before executing this installation script
################################################################################
PROJECT_NAME=dev-config/
PROJECT_FOLDER=~/Projects/
DOWNLOAD_FOLDER=~/Downloads/
VIM_COLOR_FOLDER=~/.vim/colors/
ZSH_THEME_FOLDER=~/.oh-my-zsh/themes/
################################################################################
# Install gcc compiler for OS X
xcode-select --install
################################################################################
# Install brew, git, wget for OS X
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update
brew upgrade
brew install git
brew install wget
################################################################################
# Backup existing Vim settings if any
if [ -e .vimrc ]; then mv .vimrc .vimrc_bak; fi
if [ -e .vim ]; then mv .vim .vim_bak; fi
################################################################################
# Set up directories
cd ~/
mkdir -p $PROJECT_FOLDER
mkdir -p $DOWNLOAD_FOLDER
################################################################################
# Copy configuration files
cd $PROJECT_FOLDER$PROJECT_NAME
cp tmux.conf ~/.tmux.conf
cp bashrc ~/.bashrc
mkdir -p $VIM_COLOR_FOLDER
cp gruvbox.vim $VIM_COLOR_FOLDER
# cp tjkirch-yroot.zsh-theme $ZSH_THEME_FOLDER
cp zshrc ~/.zshrc
################################################################################
# Install Vim of version 7.4 from source code
cd $DOWNLOAD_FOLDER
wget ftp://ftp.vim.org/pub/vim/unix/vim-7.4.tar.bz2
tar jxf vim-7.4.tar.bz2
cd vim74/
brew install lua
./configure --with-features=huge
make && sudo make install
################################################################################
# Install Exuberant Ctags to support tagbar (or omni-complete if used)
cd $DOWNLOAD_FOLDER
wget http://prdownloads.sourceforge.net/ctags/ctags-5.8.tar.gz
tar zxf ctags-5.8.tar.gz
cd ctags-5.8
./configure
make && sudo make install
################################################################################
# Install oh-my-zsh, may need to mannually shell change later
# the content of install.sh is not compatible with ZSH, it must be excuted under /bin/bash
wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O - | sh
################################################################################
# Install Vundle
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
# Install the plugins defined in vimrc
cd $PROJECT_FOLDER$PROJECT_NAME
cp vimrc ~/.vimrc
vim +PluginInstall +qall
################################################################################
# Install tmux by compiling from source code (Install libevent as dependency firstly)
cd $DOWNLOAD_FOLDER
wget https://sourceforge.net/projects/levent/files/libevent/libevent-2.0/libevent-2.0.22-stable.tar.gz
./configure --prefix=/usr/local/
tar zxf libevent-2.0.22-stable.tar.gz
cd libevent-2.0.22-stable/
./configure --prefix=/usr/local/
make && sudo make install  # sudo required

cd $DOWNLOAD_FOLDER
wget http://downloads.sourceforge.net/tmux/tmux-1.9a.tar.gz
tar zxf tmux-1.9a.tar.gz
cd tmux-1.9a
LDFLAGS="-L/usr/local/lib -Wl,-rpath=/usr/local/lib" ./configure --prefix=/usr/local
make && sudo make install  # sudo required
################################################################################
# Import terminal color schema for iTerm2
cd $PROJECT_FOLDER$PROJECT_NAME
open gruvbox-dark.itermcolors
################################################################################

