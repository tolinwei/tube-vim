#/bin/bash
echo "
###########################################################################
##           _         _                     _
##          | |_ _   _| |__   ___     __   _(_)_ __ ___
##          | __| | | | '_ \\ / _\\____\\ \\ / / | '_ \` _ \\
##          | |_| |_| | |_) |  __/_____\\ V /| | | | | | |
##           \\__|\\__,_|_.__/ \\___|      \\_/ |_|_| |_| |_|
##
###########################################################################
"

echo "
###########################################################################
## Seting up advanced shell environment from within this repo
###########################################################################"

echo "
###########################################################################
## Installing Command Line Tools for Debian, Ubuntu, Linux Mint and etc.
###########################################################################"
sudo apt-get update
sudo apt-get upgrade
sudo install git
sudo apt-get install build-essential

echo "
###########################################################################
## Cloning repot to home directories
###########################################################################"
git clone git@github.com:tolinwei/tube-vim.git ~/.tube-vim

echo "
###########################################################################
## Defining folder variables
###########################################################################"
cd ~/.tube-vim
PROJECT_FOLDER=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
DOWNLOAD_FOLDER=~/Downloads/
VIM_COLOR_FOLDER=~/.vim/colors/
ZSH_THEME_FOLDER=~/.oh-my-zsh/themes/

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
## Copying configuration files for bash, zhs and coloe scheme for Vim
###########################################################################"
cd $PROJECT_FOLDER
cat bashrc >> ~/.bashrc
mkdir -p $VIM_COLOR_FOLDER
cp gruvbox.vim $VIM_COLOR_FOLDER
cp zshrc ~/.zshrc

echo "
###########################################################################
## Installing Vim 7.4 compiled from source code
###########################################################################"
# https://gist.github.com/jdewit/9818870
# https://www.snip2code.com/Snippet/160269/Build-vim-7-4-with-lua-support---Ubuntu-
# Remove previous installtions
sudo apt-get remove vim vim-runtime vim-tyny vim-common
# Install dependencies
sudo apt-get install libncurses5-dev python-dev libperl-dev ruby-dev liblua5.2-dev
# Fix liblua paths
# Fix liblua paths
sudo ln -s /usr/include/lua5.2 /usr/include/lua
sudo ln -s /usr/lib/x86_64-linux-gnu/liblua5.2.so /usr/local/lib/liblua.so

cd $DOWNLOAD_FOLDER
wget ftp://ftp.vim.org/pub/vim/unix/vim-7.4.tar.bz2
tar jxf vim-7.4.tar.bz2
cd vim74/
./configure --prefix=/usr     \
    --enable-luainterp        \
    --with-luajit             \
    --with-lua-prefix=/usr/include/lua5.1   \
    --enable-perlinterp       \
    --enable-pythoninterp     \
    --enable-rubyinterp       \
    --enable-cscope           \
    --disable-netbeans        \
    --enable-multibyte        \
    --enable-largefile        \
    --enable-gui=auto         \
    --with-features=huge      \
    --with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu
make VIMRUNTIMEDIR=/usr/share/vim/vim74
sudo make install

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
## Installing vimcat
###########################################################################"
cd $DOWNLOAD_FOLDER
git clone git://github.com/rkitover/vimpager
cd vimpager
sudo make install

