#/bin/bash

function println {
    echo "[" `date` "]" $1
    if [ "$1" == "...Done" ]; then
        echo
    fi
}

echo -e "
 _         _                    _          _ _
| |_ _   _| |__   ___       ___| |__   ___| | |
| __| | | | '_ \\ / _ \\_____/ __| '_ \\ / _ \\ | |
| |_| |_| | |_) |  __/_____\\__ \\ | | |  __/ | |
 \\__|\\__,_|_.__/ \\___|     |___/_| |_|\\___|_|_|\n"


println "[Start] Seting up integrated shell environment..."

println "Defining directory variables..."
HOME_DIR=~
PROJECT_DIR=${HOME_DIR}/.tube-shell
PROJECT_COLOR_DIR=${PROJECT_DIR}/colors
PROJECT_CONFIG_DIR=${PROJECT_DIR}/config
VIM_COLOR_DIR=${HOME_DIR}/.vim/colors
println "...Done"


println "Cloning repo to home directories..."
rm -rf ${PROJECT_DIR}
git clone https://github.com/tolinwei/tube-shell.git ${PROJECT_DIR}
println "...Done\n"


println "Backing up & copying configuration files for Bash, Vim, screen and tmux..."
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
cp ${PROJECT_COLOR_DIR}/gruvbox.vim ${VIM_COLOR_DIR}
println "...Done"


println "Installing junegunn/vim-plug as Vim plugins manager..."
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
println "...Done"


println "Installing Vim plugins defined in .vimrc..."
vim +PlugInstall +qa
println "...Done\n"


println "[DONE] Finish installation, please enjoy!!"
echo -e "
 _         _                    _          _ _
| |_ _   _| |__   ___       ___| |__   ___| | |
| __| | | | '_ \\ / _ \\_____/ __| '_ \\ / _ \\ | |
| |_| |_| | |_) |  __/_____\\__ \\ | | |  __/ | |
 \\__|\\__,_|_.__/ \\___|     |___/_| |_|\\___|_|_|"
