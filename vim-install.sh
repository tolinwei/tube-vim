#!/bin/bash

################################################################################ (80 #s)
# Setup dev env from within this repo
# Install brew, git, wget if run on Mac
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"t
brew install git
brew install wget
# ###############################################################################
# Backup existing Vim setting if any exists
if [ -e .vimrc ]; then mv .vimrc .vimrc_bak; fi
if [ -e .vim ]; then mv .vim .vim_bak; fi
# ###############################################################################
# Set up directorys
mkdir -p ~/Projects
mkdir -p ~/Downloads
################################################################################
# Copy configuration files
cd ~/Projects/dev-env
cp bashrc ~/.bashrc
mkdir -p ~/.vim/colors
cp gruvbox.vim ~/.vim/colors/
cp zshrc ~/.zshrc
################################################################################
# Install Vundle
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
# Install the plugins defined in vimrc
cd ~/Projects/dev-env
cp vimrc ~/.vimrc
vim +PluginInstall +qall
################################################################################
# Install oh-my-zsh, may need to mannually change later
# the content of install.sh is not compatible with ZSH, it must be excuted under /bin/bash
wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O - | sh
################################################################################

