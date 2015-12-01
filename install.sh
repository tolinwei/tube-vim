#!/bin/bash

function println {
    echo "[" `date` "]" $1
    # if [ "$1" == "...Done" ]; then
        # echo
    # fi
}

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

echo -e "${YELLOW}
 _         _                    _          _ _
| |_ _   _| |__   ___       ___| |__   ___| | |
| __| | | | '_ \\ / _ \\_____/ __| '_ \\ / _ \\ | |
| |_| |_| | |_) |  __/_____\\__ \\ | | |  __/ | |
 \\__|\\__,_|_.__/ \\___|     |___/_| |_|\\___|_|_|${NORMAL}\n"

println "${YELLOW}[Start] Seting up integrated shell environment...${NORMAL}\n"


println "${YELLOW}Defining directory variables...${NORMAL}"
HOME_DIR=~
PROJECT_DIR=${HOME_DIR}/.tube-shell
OH_MY_ZSH_DIR=${HOME_DIR}/.oh-my-zsh
PROJECT_COLOR_DIR=${PROJECT_DIR}/colors
PROJECT_CONF_DIR=${PROJECT_DIR}/config
VIM_COLOR_DIR=${HOME_DIR}/.vim/colors
println "${YELLOW}...Done${NORMAL}\n"


println "${YELLOW}Installing brew, git for OS X...${NORMAL}"
which -s brew
if [ $? != 0 ]; then
    println "Installing new Homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    println "Updating & upgrading Homebrew"
    brew update
    brew upgrade
fi
println "Installing git via Homebrew...${NORMAL}"
which -s git || brew install git
println "${YELLOW}...Done${NORMAL}\n"


println "${YELLOW}Cloning repo to home directories...${NORMAL}"
rm -rf ${PROJECT_DIR}
git clone https://github.com/tolinwei/tube-shell.git ${PROJECT_DIR}
println "${YELLOW}...Done${NORMAL}\n"


println "${YELLOW}Installing Command Line Tools for OS X...${NORMAL}"
xcode-select --install
println "${YELLOW}...Done${NORMAL}\n"


println "${YELLOW}Installing Vim & tmux via Homebrew...${NORMAL}"
brew install vim
brew install tmux
println "${YELLOW}...Done${NORMAL}\n"


println "${YELLOW}Backing up & copying configuration files for Bash, Vim, screen and tmux...${NORMAL}"
date_time=`date +"%y-%m-%d-%H:%M"`
if [ -e ${HOME_DIR}/.bashrc ]; then  # Special process for .bashrc
    println "Skipping .bashrc as it's existed"
else
    cp ${PROJECT_CONF_DIR}/bashrc ${HOME_DIR}/.bashrc
fi
if [ -e ${HOME_DIR}/.vimrc ]; then
    println "Backing up .vimrc to .vimrc.bak-${date_time}"
    mv ${HOME_DIR}/.vimrc ${HOME_DIR}/.vimrc.bak-${date_time}
fi
if [ -d ${HOME_DIR}/.vim ]; then
    println "Backing up .vim directory to .vim.bak-${date_time}"
    mv ${HOME_DIR}/.vim ${HOME_DIR}/.vim.bak-${date_time}
fi
println "Copying .vimrc to home directory"
cp ${PROJECT_CONF_DIR}/vimrc ${HOME_DIR}/.vimrc
if [ -e ${HOME_DIR}/.screenrc ]; then
    println "Backing up .screenrc to .screenrc.bak-${date_time}"
    mv ${HOME_DIR}/.screenrc ${HOME_DIR}/.screenrc.bak-${date_time}
fi
if [ -e ${HOME_DIR}/.tmux.conf ]; then
    println "Backing up .tmux.conf to .tmux.conf.bak-${date_time}"
    mv ${HOME_DIR}/.tmux.conf ${HOME_DIR}/.tmux.conf.bak-${date_time}
fi
println "Copying .tmux.conf & .screenrc to home directory"
cp ${PROJECT_CONF_DIR}/tmux.conf ${HOME_DIR}/.tmux.conf
cp ${PROJECT_CONF_DIR}/screenrc ${HOME_DIR}/.screenrc
println "Copying Vim color scheme to ${VIM_COLOR_DIR}"
mkdir -p ${VIM_COLOR_DIR}
cp ${PROJECT_COLOR_DIR}/gruvbox.vim ${VIM_COLOR_DIR}
println "${YELLOW}...Done${NORMAL}\n"


println "${YELLOW}Installing Exuberant Ctags to support tagbar via Homebrew...${NORMAL}"
CTAGS_DIR=`which ctags`
if [ ${CTAGS_DIR} != '/usr/local/bin/ctags' ]; then
    println "Installing new Ctags via Homebrew";
    brew install ctags
else
    println "Exuberant Ctags (Homebrew version) has already installed"
fi
println "${YELLOW}...Done${NORMAL}\n"


println "${YELLOW}Installing junegunn/vim-plug as Vim plugins manager...${NORMAL}"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
println "${YELLOW}...Done${NORMAL}\n"


println "${YELLOW}Installing Vim plugins defined in .vimrc..."
vim +PlugInstall +qa
println "${YELLOW}...Done${NORMAL}\n"


println "${YELLOW}Installing oh-my-zsh & copying configuration file...${NORMAL}"
if [ -d ${OH_MY_ZSH_DIR} ]; then
    rm -rf ${OH_MY_ZSH_DIR}
fi
sh -c "$(curl -fsSL https://raw.github.com/tolinwei/oh-my-zsh/master/tools/install.sh)" # && \
    # cp ${PROJECT_CONF_DIR}/zshrc ${HOME_DIR}/.zshrc && \
    # exit"
println "Copying zshrc to home directory"
cp ${PROJECT_CONF_DIR}/zshrc ${HOME_DIR}/.zshrc
println "${YELLOW}...Done${NORMAL}\n"


println "${YELLOW}Importing color scheme for iTerm2 & Terminal.app...${NORMAL}"
cd ${PROJECT_COLOR_DIR}
open gruvbox-dark.itermcolors
open gruvbox-dark.terminal
println "${YELLOW}...Done${NORMAL}\n"


println "${YELLOW}[End] Finish! Please restart your terminal emulator to enjoy!!${NORMAL}"
echo -e "${YELLOW}
 _         _                    _          _ _
| |_ _   _| |__   ___       ___| |__   ___| | |
| __| | | | '_ \\ / _ \\_____/ __| '_ \\ / _ \\ | |
| |_| |_| | |_) |  __/_____\\__ \\ | | |  __/ | |
 \\__|\\__,_|_.__/ \\___|     |___/_| |_|\\___|_|_|${NORMAL}"
