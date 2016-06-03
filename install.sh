#!/bin/bash
# Define colors for prompt if terminal supports
if which tput >/dev/null 2>&1; then
    ncolors=$(tput colors)
fi
if [ -t 1 ] && [ -n "$ncolors" ] && [ "$ncolors" -ge 8 ]; then
    YELLOW="$(tput setaf 3)"
    NORMAL="$(tput sgr0)"
else
    YELLOW=""
    NORMAL=""
fi

function println {
    echo "[" `date` "]" $1
}

function cprintln {
    echo -e "${YELLOW}[" `date` "]" $1 "${NORMAL}"
    if [ "$1" == "...Done" ]; then
        echo
    fi
}

echo -e "${YELLOW}
 _         _                     _
| |_ _   _| |__   ___     __   _(_)_ __ ___
| __| | | | '_ \\ / _ \\____\\ \\ / / | '_ \` _ \\
| |_| |_| | |_) |  __/_____\\ V /| | | | | | |
 \\__|\\__,_|_.__/ \\___|      \\_/ |_|_| |_| |_|${NORMAL}\n"

cprintln "[Start] Seting up tube-vim...\n"

cprintln "Defining directory variables..."
HOME_DIR=~
PROJECT_DIR=${HOME_DIR}/.tube-vim
PROJECT_THEME_DIR=${PROJECT_DIR}/themes
PROJECT_CONF_DIR=${PROJECT_DIR}/config
OH_MY_ZSH_DIR=${HOME_DIR}/.oh-my-zsh
OH_MY_ZSH_THEME_DIR=${OH_MY_ZSH_DIR}/themes
VIM_COLOR_DIR=${HOME_DIR}/.vim/colors
cprintln "...Done"

cprintln "Installing Command Line Tools for OS X..."
which -s xcode-select
if [ $? != 0 ]; then
    xcode-select --install
fi
cprintln "...Done"

cprintln "Installing brew, git for OS X..."
which -s brew
if [ $? != 0 ]; then
    println "Installing new Homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    println "Homebrew has installed, updating & upgrading git..."
    brew update
    brew upgrade git
fi
which -s git
if [ $? != 0 ]; then
    println "Installing git via Homebrew..."
    brew install git
fi
cprintln "...Done"


cprintln "Cloning repo to ${PROJECT_DIR}..."
rm -rf ${PROJECT_DIR}
git clone https://github.com/tolinwei/tube-shell.git ${PROJECT_DIR}
cprintln "...Done"


cprintln "Installing Command Line Tools for OS X..."
xcode-select --install
cprintln "...Done"


cprintln "Installing Vim via Homebrew..."
brew install vim
cprintln "...Done"


cprintln "Backing up & copying conf files for Bash, Vim, screen..."
date_time=`date +"%y-%m-%d-%H:%M"`
# For .bashrc
if [ -e ${HOME_DIR}/.bashrc ]; then
    println "Skipping .bashrc as it's existed..."
else
    println "Copying new .bashrc to ${HOME_DIR}..."
    cp ${PROJECT_CONF_DIR}/bashrc ${HOME_DIR}/.bashrc
fi

# For .vim/ and .vimrc
if [ -e ${HOME_DIR}/.vimrc ]; then
    println "Backing up ${HOME_DIR}/.vimrc to ${HOME_DIR}/.vimrc.bak-${date_time}..."
    mv ${HOME_DIR}/.vimrc ${HOME_DIR}/.vimrc.bak-${date_time}
fi
if [ -d ${HOME_DIR}/.vim ]; then
    println "Backing up ${HOME_DIR}/.vim/ folder to ${HOME_DIR}/.vim.bak-${date_time}..."
    mv ${HOME_DIR}/.vim ${HOME_DIR}/.vim.bak-${date_time}
fi
println "Copying new .vimrc to ${HOME_DIR}..."
cp ${PROJECT_CONF_DIR}/vimrc ${HOME_DIR}/.vimrc

# For screen
if [ -e ${HOME_DIR}/.screenrc ]; then
    println "Backing up ${HOME_DIR}/.screenrc to ${HOME_DIR}/.screenrc.bak-${date_time}..."
    mv ${HOME_DIR}/.screenrc ${HOME_DIR}/.screenrc.bak-${date_time}
fi
println "Copying new .screenrc to ${HOME_DIR}..."
cp ${PROJECT_CONF_DIR}/screenrc ${HOME_DIR}/.screenrc

# For Vim color scheme – Gruvbox
println "Copying Vim color scheme – Gruvbox to ${VIM_COLOR_DIR}..."
mkdir -p ${VIM_COLOR_DIR}
cp ${PROJECT_THEME_DIR}/gruvbox.vim ${VIM_COLOR_DIR}
cprintln "...Done"


cprintln "Installing Exuberant Ctags to support tagbar via Homebrew..."
CTAGS_DIR=`which ctags`
if [ ${CTAGS_DIR} != '/usr/local/bin/ctags' ]; then
    println "Installing new Ctags via Homebrew...";
    brew install ctags
else
    println "Exuberant Ctags (Homebrew version) has already installed..."
fi
cprintln "...Done"


cprintln "Installing junegunn/vim-plug as Vim plugins manager..."
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
cprintln "...Done"


cprintln "Installing Vim plugins defined in .vimrc..."
vim +PlugInstall +qa
cprintln "...Done"


cprintln "Installing oh-my-zsh & copying configuration file..."
if [ -d ${OH_MY_ZSH_DIR} ]; then
    rm -rf ${OH_MY_ZSH_DIR}
fi
bash <(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)
println "Copying new .zshrc to ${HOME_DIR}..."
cp ${PROJECT_CONF_DIR}/zshrc ${HOME_DIR}/.zshrc
println "Copying Zsh theme – tube.zsh-theme to ${OH_MY_ZSH_THEME_DIR}..."
cp ${PROJECT_THEME_DIR}/tube.zsh-theme ${OH_MY_ZSH_THEME_DIR}
cprintln "...Done"


cprintln "Importing color scheme for iTerm2 & Terminal.app..."
cd ${PROJECT_THEME_DIR}
open gruvbox-dark.itermcolors
open gruvbox-dark.terminal
cprintln "...Done"


cprintln "[End] Finish! Please restart your terminal emulator to enjoy!!"
echo -e "${YELLOW}
 _         _                     _
| |_ _   _| |__   ___     __   _(_)_ __ ___
| __| | | | '_ \\ / _ \\____\\ \\ / / | '_ \` _ \\
| |_| |_| | |_) |  __/_____\\ V /| | | | | | |
 \\__|\\__,_|_.__/ \\___|      \\_/ |_|_| |_| |_|${NORMAL}\n"

