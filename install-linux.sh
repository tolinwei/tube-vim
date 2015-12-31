#/bin/bash


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
 _         _                    _          _ _
| |_ _   _| |__   ___       ___| |__   ___| | |
| __| | | | '_ \\ / _ \\_____/ __| '_ \\ / _ \\ | |
| |_| |_| | |_) |  __/_____\\__ \\ | | |  __/ | |
 \\__|\\__,_|_.__/ \\___|     |___/_| |_|\\___|_|_|${NORMAL}\n"


cprintln "[Start] Seting up integrated shell environment...\n"

cprintln "Defining directory variables..."
HOME_DIR=~
PROJECT_DIR=${HOME_DIR}/.tube-shell
PROJECT_THEME_DIR=${PROJECT_DIR}/themes
PROJECT_CONF_DIR=${PROJECT_DIR}/config
VIM_COLOR_DIR=${HOME_DIR}/.vim/colors
cprintln "...Done"


cprintln "Cloning repo to home directories..."
rm -rf ${PROJECT_DIR}
git clone https://github.com/tolinwei/tube-shell.git ${PROJECT_DIR}
cprintln "...Done\n"


cprintln "Backing up & copying configuration files for Bash, Vim, screen and tmux..."
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
cp ${PROJECT_CONF_DIR}/vimrc-linux ${HOME_DIR}/.vimrc
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
cp ${PROJECT_THEME_DIR}/gruvbox.vim ${VIM_COLOR_DIR}
cprintln "...Done"


cprintln "Installing junegunn/vim-plug as Vim plugins manager..."
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
cprintln "...Done"


cprintln "Installing Vim plugins defined in .vimrc..."
vim +PlugInstall +qa
cprintln "...Done\n"


cprintln "[End] Finish! Please restart your terminal emulator to enjoy!!"
echo -e "${YELLOW}
 _         _                    _          _ _
| |_ _   _| |__   ___       ___| |__   ___| | |
| __| | | | '_ \\ / _ \\_____/ __| '_ \\ / _ \\ | |
| |_| |_| | |_) |  __/_____\\__ \\ | | |  __/ | |
 \\__|\\__,_|_.__/ \\___|     |___/_| |_|\\___|_|_|${NORMAL}\n"
