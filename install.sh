#!/bin/bash

function println {
    echo "[" `date` "]" $1
    if [ "$1" == "[Info] ...Done" ]; then
        echo
    fi
}

echo -e "
     _         _                     _
    | |_ _   _| |__   ___     __   _(_)_ __ ___
    | __| | | | '_ \\ / _ \\____\\ \\ / / | '_ \` _ \\
    | |_| |_| | |_) |  __/_____\\ V /| | | | | | |
     \\__|\\__,_|_.__/ \\___|      \\_/ |_|_| |_| |_|\n"



println "[Start] Seting up advanced CLI environment..."


println "[Info] Defining directory variables..."
HOME_DIR=~
PROJECT_DIR=${HOME_DIR}/.tube-vim
PROJECT_COLOR_DIR=${PROJECT_DIR}/colors
PROJECT_CONFIG_DIR=${PROJECT_DIR}/config
VIM_COLOR_DIR=${HOME_DIR}/.vim/colors
ZSH_THEME_DIR=${HOME_DIR}/.oh-my-zsh/themes
println "[Info] ...Done"


println "[Info] Installing brew, git for OS X..."
which -s brew
if [ $? != 0 ]; then
    println "[Info] Installing new Homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    println "[Info] Updating and upgrading Homebrew"
    brew update
    brew upgrade
fi
println "[Info] Installing git via Homebrew..."
which -s git || brew install git
println "[Info] ...Done"


println "[Info] Cloning repo to home directories..."
rm -rf $PROJECT_DIR
git clone https://github.com/tolinwei/tube-vim.git $PROJECT_DIR
println "[Info] ...Done"


println "[Info] Installing Command Line Tools for OS X (Please click 'Install' on popup window)..."
xcode-select --install
println "[Info] ...Done"


println "[Info] Backing up existing Vim, screen, tmux settings and bashrc..."
cd $HOME_DIR
date_time=`date +"%y-%m-%d-%H:%M"`
if [ -e .vimrc ] ; then
    println "[Info] Backing up .vimrc to .vimrc.bak-${date_time}"
    mv .vimrc .vimrc.bak-${date_time}
fi
if [ -d .vim ] ; then
    println "[Info] Backing up .vim directory to .vim.bak-${date_time}"
    mv .vim .vim.bak-${date_time}
fi
if [ -e .screenrc ] ; then
    println "[Info] Backing up .screenrc to .screenrc.bak-${date_time}"
    mv .screen .screenrc.bak-${date_time}
fi
if [ -e .tmux.conf ] ; then
    println "[Info] Backing up .tmux.conf to .tmux.conf.bak-${date_time}"
    mv .tmux.conf .tmux.conf.bak-${date_time}
fi
if [ -e .bashrc ] ; then
    println "[Info] Backing up .bashrc to .bashrc.bak-${date_time}"
    mv .bashrc .bashrc.bak-${date_time}
fi
println "[Info] ...Done"


println "[Info] Installing Vim and tmux via Homebrew..."
# Needs to restart shell session to make installation works
# brew install macvim --with-lua
# brew linkapps macvim
brew install vim
brew install tmux
println "[Info] ...Done"


println "[Info] Installing Exuberant Ctags to support tagbar via Homebrew..."
CTAGS_DIR=`which ctags`
if [ $CTAGS_DIR != '/usr/local/bin/ctags' ]; then
    #cd $DOWNLOAD_DIR
    #curl -L http://prdownloads.sourceforge.net/ctags/ctags-5.8.tar.gz
    #tar zxf ctags-5.8.tar.gz
    #cd ctags-5.8
    #./configure -prefix=/usr/local
    #make && sudo make install
    println "[Info] Installing new Ctags via Homebrew";
    brew install ctags
else
    println "[Info] Exuberant Ctags (Homebrew version) has already installed"
fi
println "[Info] ...Done"


println "[Info] Copying configuration file for bash, tmux, screen and color scheme for Vim..."
cd $PROJECT_CONFIG_DIR
cat bashrc >> ${HOME_DIR}/.bashrc
cp tmux.conf ${HOME_DIR}/.tmux.conf
cp screenrc ${HOME_DIR}/.screenrc

mkdir -p $VIM_COLOR_DIR
cd $PROJECT_COLOR_DIR
cp gruvbox.vim $VIM_COLOR_DIR
println "[Info] ...Done"


println "[Info] Installing junegunn/vim-plug as Vim plugins manager..."
# if [ ! -d ${HOME_DIR}/.vim/bundle/Vundle.vim ] ; then
#     git clone https://github.com/gmarik/Vundle.vim.git ${HOME_DIR}/.vim/bundle/Vundle.vim
# fi
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
println "[Info] ...Done"


println "[Info] Installing Vim plugins defined in vimrc..."
cd $PROJECT_CONFIG_DIR
cp vimrc ${HOME_DIR}/.vimrc
vim +PlugInstall +qa
# vim +PluginInstall +qa
println "[Info] ...Done"


println "[Info] Installing cmake, then compile YouCompleteMe..."
brew install cmake
cd $HOME_DIR/.vim/bundle/YouCompleteMe
./install.sh --clang-completer \
             --omnisharp-completer \
             --gocode-completer
println "[Info] ...Done"


println "[Info] Importing color scheme for iTerm2 and terminal (Please click 'OK' on the popup window..."
cd $PROJECT_COLOR_DIR
open gruvbox-dark.itermcolors
open gruvbox-dark.terminal
println "[Info] ...Done"


println "[Info] Installing oh-my-zsh, and copying configuration file..."
if [ ! -d ${HOME_DIR}/.oh-my-zsh ]; then
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi
cd $PROJECT_CONFIG_DIR
cp zshrc ${HOME_DIR}/.zshrc
println "[Info] ...Done"


println "[End] Finish installation, please enjoy!!"
echo -e "
     _         _                     _
    | |_ _   _| |__   ___     __   _(_)_ __ ___
    | __| | | | '_ \\ / _ \\____\\ \\ / / | '_ \` _ \\
    | |_| |_| | |_) |  __/_____\\ V /| | | | | | |
     \\__|\\__,_|_.__/ \\___|      \\_/ |_|_| |_| |_|\n"


