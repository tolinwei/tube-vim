#!/bin/bash

function println {
    echo "[" `date` "]" $1
    if [ "$1" == "...Done" ]; then
        echo
    fi
}

echo -e "
     _         _                     _
    | |_ _   _| |__   ___     __   _(_)_ __ ___
    | __| | | | '_ \\ / _ \\____\\ \\ / / | '_ \` _ \\
    | |_| |_| | |_) |  __/_____\\ V /| | | | | | |
     \\__|\\__,_|_.__/ \\___|      \\_/ |_|_| |_| |_|\n"


println "[Start] Seting up integrated shell environment..."


println "Defining directory variables..."
HOME_DIR=~
PROJECT_DIR=${HOME_DIR}/.tube-vim
PREZTO_DIR=${HOME_DIR}/.zprezto
PROJECT_COLOR_DIR=${PROJECT_DIR}/colors
PROJECT_CONF_DIR=${PROJECT_DIR}/config
VIM_COLOR_DIR=${HOME_DIR}/.vim/colors
PREZTO_CONF_DIR=${HOME_DIR}/.zprezto/runcoms
PREZTO_THEME_DIR=${HOME_DIR}/.zprezto/modules/prompt/functions
println "...Done"


println "Installing brew, git for OS X..."
which -s brew
if [ $? != 0 ]; then
    println "Installing new Homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    println "Updating and upgrading Homebrew"
    brew update
    brew upgrade
fi
println "Installing git via Homebrew..."
which -s git || brew install git
println "...Done"


println "Cloning repo to home directories..."
rm -rf $PROJECT_DIR
git clone https://github.com/tolinwei/tube-vim.git $PROJECT_DIR
println "...Done"


println "Installing Command Line Tools for OS X (please click 'Install' on popup window)..."
xcode-select --install
println "...Done"


println "Backing up existing Vim, screen, tmux settings, bashrc and zsh related..."
cd $HOME_DIR
date_time=`date +"%y-%m-%d-%H:%M"`
if [ -e .vimrc ]; then
    println "Backing up .vimrc to .vimrc.bak-${date_time}"
    mv .vimrc .vimrc.bak-${date_time}
fi
if [ -d .vim ]; then
    println "Backing up .vim directory to .vim.bak-${date_time}"
    mv .vim .vim.bak-${date_time}
fi
if [ -e .screenrc ]; then
    println "Backing up .screenrc to .screenrc.bak-${date_time}"
    mv .screenrc .screenrc.bak-${date_time}
fi
if [ -e .tmux.conf ]; then
    println "Backing up .tmux.conf to .tmux.conf.bak-${date_time}"
    mv .tmux.conf .tmux.conf.bak-${date_time}
fi
if [ -e .bashrc ]; then  # Special process for .bashrc
    println "Skipping .bashrc as it's existed"
fi
if [ -e .zshenv ]; then
    println "Backing up .zshenv to .zshenv.bak-${date_time}"
    mv .zshenv .zshenv.bak-${date_time}
fi
if [ -e .zprofile ]; then
    println "Backing up .zprofile to .zprofile.bak-${date_time}"
    mv .zprofile .zprofile.bak-${date_time}
fi
if [ -e .zshrc ]; then
    println "Backing up .zshrc to .zshrc.bak-${date_time}"
    mv .zshrc .zshrc.bak-${date_time}
fi
if [ -e .zpreztorc ]; then
    println "Backing up .zpreztorc to .zpreztorc.bak-${date_time}"
    mv .zpreztorc .zpreztorc.bak-${date_time}
fi
if [ -e .zlogin ]; then
    println "Backing up .zlogin to .zlogin.bak-${date_time}"
    mv .zlogin .zlogin.bak-${date_time}
fi
if [ -e .zlogout ]; then
    println "Backing up .zlogout to .zlogout.bak-${date_time}"
    mv .zlogout .zlogout.bak-${date_time}
fi
println "...Done"


println "Installing Vim and tmux via Homebrew..."
# Needs to restart shell session to make installation works
# brew install macvim --with-lua
# brew linkapps macvim
brew install vim
brew install tmux
println "...Done"


println "Installing Exuberant Ctags to support tagbar via Homebrew..."
CTAGS_DIR=`which ctags`
if [ $CTAGS_DIR != '/usr/local/bin/ctags' ]; then
    println "Installing new Ctags via Homebrew";
    brew install ctags
else
    println "Exuberant Ctags (Homebrew version) has already installed"
fi
println "...Done"


println "Copying configuration file for bash, tmux, screen and color scheme for Vim..."
cd $PROJECT_CONF_DIR
if [ ! -f ${HOME_DIR}/.bashrc ]; then
    cp bashrc ${HOME_DIR}/.bashrc
fi
cp tmux.conf ${HOME_DIR}/.tmux.conf
cp screenrc ${HOME_DIR}/.screenrc

mkdir -p $VIM_COLOR_DIR
cd $PROJECT_COLOR_DIR
cp gruvbox.vim $VIM_COLOR_DIR
println "...Done"


println "Installing junegunn/vim-plug as Vim plugins manager..."
# if [ ! -d ${HOME_DIR}/.vim/bundle/Vundle.vim ]; then
#     git clone https://github.com/gmarik/Vundle.vim.git ${HOME_DIR}/.vim/bundle/Vundle.vim
# fi
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
println "...Done"


println "Installing Vim plugins defined in vimrc..."
cd $PROJECT_CONF_DIR
cp vimrc ${HOME_DIR}/.vimrc
vim +PlugInstall +qa
# vim +PluginInstall +qa
println "...Done"


println "Importing color scheme for iTerm2 and terminal (please click 'OK' on the popup window)..."
cd $PROJECT_COLOR_DIR
open gruvbox-dark.itermcolors
open gruvbox-dark.terminal
println "...Done"


println "Installing oh-my-zsh, and copying configuration file..."
if [ ! -d ${HOME_DIR}/.oh-my-zsh ]; then
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi
cd $PROJECT_CONF_DIR
cp zshrc ${HOME_DIR}/.zshrc
println "...Done"


println "[End] Finish installation, please enjoy!!"
echo -e "
     _         _                     _
    | |_ _   _| |__   ___     __   _(_)_ __ ___
    | __| | | | '_ \\ / _ \\____\\ \\ / / | '_ \` _ \\
    | |_| |_| | |_) |  __/_____\\ V /| | | | | | |
     \\__|\\__,_|_.__/ \\___|      \\_/ |_|_| |_| |_|\n"

