#!/bin/bash
echo -e "
     _         _                     _
    | |_ _   _| |__   ___     __   _(_)_ __ ___
    | __| | | | '_ \\ / _ \\____\\ \\ / / | '_ \` _ \\
    | |_| |_| | |_) |  __/_____\\ V /| | | | | | |
     \\__|\\__,_|_.__/ \\___|      \\_/ |_|_| |_| |_|\n"

echo -e "## [START] Seting up advanced Shell environment from within this repo...\n"

echo -e "## [STAGE] Defining directory variables..."
HOME_DIR=~
PROJECT_DIR=${HOME_DIR}/.tube-vim/
DOWNLOAD_DIR=${HOME_DIR}/Downloads/
VIM_COLOR_DIR=${HOME_DIR}/.vim/colors/
ZSH_THEME_DIR=${HOME_DIR}/.oh-my-zsh/themes/
echo -e "## [STAGE] ...Done\n"

echo -e "## [STAGE] Installing brew, git, wget for OS X..."
which -s brew
if [[ $? != 0 ]] ; then
    echo -e "## [INFO] Installing new Homebrew"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    echo -e "## [INFO] Updating and Upgrading Homebrew"
    brew update
    brew upgrade
fi
echo -e "## [INFO] Installing git via Homebrew"
which -s git || brew install git
echo -e "## [STAGE] ...Done\n"

echo -e "## [STAGE] Cloning repo to home directories..."
rm -rf $PROJECT_DIR
git clone https://github.com/tolinwei/tube-vim.git $PROJECT_DIR
echo -e "## [STAGE] ...Done\n"

echo -e "## [STAGE] Installing Command Line Tools for OS X (please click 'Install' on popup window)..."
xcode-select --install
echo -e "## [STAGE] ...Done\n"

echo -e "## [STAGE] Backing up existing Vim, screen, tmux settings..."
cd $HOME_DIR
date_time=`date +"%y-%m-%d-%H:%M"`
if [ -e .vimrc ] ; then
    echo -e "## [INFO] Backing up .vimrc to .vimrc.bak-${date_time}"
    mv .vimrc .vimrc.bak-${date_time}
fi
if [ -d .vim ] ; then
    echo -e "## [INFO] Backing up .vim directory to .vim.bak-${date_time}"
    mv .vim .vim.bak-${date_time}
fi
if [ -e .screenrc ] ; then
    echo -e "## [INFO] Backing up .screenrc to .screenrc.bak-${date_time}"
    mv .screen .screenrc.bak-${date_time}
fi
if [ -e .tmux.conf ] ; then
    echo -e "## [INFO] Backing up .tmux.conf to .tmux.conf.bak-${date_time}"
    mv .tmux.conf .tmux.conf.bak-${date_time}
fi
echo -e "## [STAGE] ...Done\n"

echo -e "## [STAGE] Setting up directories..."
cd $HOME_DIR
mkdir -p $DOWNLOAD_DIR
echo -e "## [STAGE] ...Done\n"

echo -e "## [STAGE] Installing Vim and tmux via Homebrew..."
## https://github.com/Homebrew/homebrew/blob/master/Library/Formula/vim.rb
## Needs to restart shell session to make installation works

#brew install macvim --with-lua
#brew linkapps macvim

brew install vim
brew install tmux
echo -e "## [STAGE] ...Done\n"

echo -e "## [STAGE] Installing Exuberant Ctags to support tagbar via Homebrew..."
CTAGS_DIR=`which ctags`
if [ $CTAGS_DIR != '/usr/local/bin/ctags' ] ; then
    #cd $DOWNLOAD_DIR
    #curl -L http://prdownloads.sourceforge.net/ctags/ctags-5.8.tar.gz
    #tar zxf ctags-5.8.tar.gz
    #cd ctags-5.8
    #./configure -prefix=/usr/local
    #make && sudo make install
    echo -e "## [INFO] Installing new Ctags";
    brew install ctags
else
    echo -e "## [INFO] Exuberant Ctags has already installed"
fi
echo -e "## [STAGE] ...Done\n"

echo -e "## [STAGE] Installing oh-my-zsh..."
if [ ! -d ${HOME_DIR}/.oh-my-zsh ]; then
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi
echo -e "## [STAGE] ...Done\n"

echo -e "## [STAGE] Copying configuration files for bash, zsh and color scheme for Vim..."
cd $HOME_DIR
if [ -e .bashrc ] ; then
    echo -e "## [INFO] Backing up existing .bashrc to .bashrc.bak-${date_time}"
    mv .bashrc .bashrc.bak-${date_time}
fi
cd $PROJECT_DIR
cat bashrc >> ${HOME_DIR}/.bashrc
mkdir -p $VIM_COLOR_DIR
cp gruvbox.vim $VIM_COLOR_DIR
cp zshrc ${HOME_DIR}/.zshrc
echo -e "## [STAGE] ...Done\n"

echo -e "## [STAGE] Installing Vundle for manegement of Vim plugins..."
if [ ! -d ${HOME_DIR}/.vim/bundle/Vundle.vim ] ; then
    git clone https://github.com/gmarik/Vundle.vim.git ${HOME_DIR}/.vim/bundle/Vundle.vim
fi
echo -e "## [STAGE] ...Done\n"

echo -e "## [STAGE] Installing Vim plugins defined in vimrc..."
cd $PROJECT_DIR
cp vimrc ${HOME_DIR}/.vimrc
vim +PluginInstall +qa
echo -e "## [STAGE] ...Done\n"

echo -e "## [STAGE] Installing cmake, then compile YouCompleteMe..."
brew install cmake
cd $HOME_DIR/.vim/bundle/YouCompleteMe
./install.sh --clang-completer \
             --omnisharp-completer \
             --gocode-completer
echo -e "## [STAGE] ...Done\n"

echo -e "## [STAGE] Importing color scheme for iTerm2 and terminal (please click 'OK' on the popup window..."
cd $PROJECT_DIR
open gruvbox-dark.itermcolors
open gruvbox-dark.terminal
open gruvbox-light.itermcolors
open gruvbox-light.terminal
echo -e "## [STAGE] ...Done\n"

echo -e "## [DONE] Finish installation, please enjoy!!"
echo -e "
     _         _                     _
    | |_ _   _| |__   ___     __   _(_)_ __ ___
    | __| | | | '_ \\ / _ \\____\\ \\ / / | '_ \` _ \\
    | |_| |_| | |_) |  __/_____\\ V /| | | | | | |
     \\__|\\__,_|_.__/ \\___|      \\_/ |_|_| |_| |_|\n"

