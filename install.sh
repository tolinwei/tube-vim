#!/bin/bash

################################################## (50 #s)
# Setup dev env from within this repo
# Install brew, git, wget if run on Mac
# ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"t
# brew install git
# brew install wget
##################################################
# Set up directorys
mkdir -p ~/Projects
mkdir -p ~/Downloads

# Install Vim of version 7.4 from source code
cd ~/Downloads
wget ftp://ftp.vim.org/pub/vim/unix/vim-7.4.tar.bz2
tar jxvf vim-7.4.tar.bz2
cd vim74
./configure --with-features=huge
make && sudo make install

# Install oh-my-zsh, need to mannually change later
# the content of install.sh is not compatible with ZSH, it must be excuted under /bin/bash
wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O - | sh

# Install Vundle
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
# Install the plugins defined in vimrc
cp vimrc ~/.vimrc
vim +PluginInstall +qall

# Install tmux by compiling from source code
cd ~/Downloads
wget https://sourceforge.net/projects/levent/files/libevent/libevent-2.0/libevent-2.0.22-stable.tar.gz
./configure --prefix=/usr/local/
tar zxvf libevent-2.0.22-stable.tar.gz
cd libevent-2.0.22-stable/
./configure --prefix=/usr/local/
make && sudo make install  # sudo required

cd ..
wget http://downloads.sourceforge.net/tmux/tmux-1.9a.tar.gz
tar zxvf tmux-1.9a.tar.gz
cd tmux-1.9a
LDFLAGS="-L/usr/local/lib -Wl,-rpath=/usr/local/lib" ./configure --prefix=/usr/local
make && sudo make install  # sudo required

# Copy remaining configuration files
cd ~/Projects/dev-env
cp tmux.conf ~/.tmux.conf
cp bashrc ~/.bashrc
mkdir -p ~/.vim/colors
cp gruvbox.vim ~/.vim/colors/
cp Tomorrow-Night.vim ~/.vim/colors/
cp Tomorrow-Night-Eighties.vim ~/.vim/colors/
cp tjkirch-yroot.zsh-theme ~/.oh-my-zsh/themes/
cp zshrc ~/.zshrc

