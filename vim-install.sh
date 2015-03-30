#!/bin/bash

################################################################################ (80 #s)
# Setup dev env from within this repo
# Install brew, git, wget if run on Mac
# ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"t
# brew install git
# brew install wget
################################################################################
# Set up directorys
mkdir -p ~/Projects
mkdir -p ~/Downloads
################################################################################
# Copy configuration files
cd ~/Projects/dev-env
cp tmux.conf ~/.tmux.conf
cp bashrc ~/.bashrc
mkdir -p ~/.vim/colors
cp gruvbox.vim ~/.vim/colors/
cp Tomorrow-Night.vim ~/.vim/colors/
cp Tomorrow-Night-Eighties.vim ~/.vim/colors/
cp tjkirch-yroot.zsh-theme ~/.oh-my-zsh/themes/
cp zshrc ~/.zshrc
################################################################################
# Install Vundle
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
# Install the plugins defined in vimrc
cd ~/Projects/dev-env
cp vimrc ~/.vimrc
vim +PluginInstall +qall