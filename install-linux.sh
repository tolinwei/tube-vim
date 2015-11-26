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
ZSH_THEME_DIR=${HOME_DIR}/.oh-my-zsh/themes
println "...Done"


println "Cloning repo to home directories..."
rm -rf ${PROJECT_DIR}
git clone https://github.com/tolinwei/tube-shell.git ${PROJECT_DIR}
println "...Done\n"


println "Backing up existing Vim, screen, tmux settings and bashrc..."
cd ${HOME_DIR}
date_time=`date +"%y-%m-%d-%H:%M"`
if [ -e .bashrc ]; then
    println "Skipping .bashrc as it's existed"
fi
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
println "...Done"


println "Copying configuration file for bash, tmux, screen and color scheme for Vim..."
cd ${PROJECT_CONFIG_DIR}
if [ ! -f ${HOME_DIR}/.bashrc ]; then
    cp bashrc ${HOME_DIR}/.bashrc
fi
cp tmux.conf ${HOME_DIR}/.tmux.conf
cp screenrc ${HOME_DIR}/.screenrc

mkdir -p ${VIM_COLOR_DIR}
cd ${PROJECT_COLOR_DIR}
cp gruvbox.vim ${VIM_COLOR_DIR}
println "...Done"


println "Installing junegunn/vim-plug as Vim plugins manager..."
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
println "...Done"


println "Installing Vim plugins defined in vimrc..."
cd ${PROJECT_CONFIG_DIR}
cp vimrc-linux ${HOME_DIR}/.vimrc
vim +PlugInstall +qa
println "...Done\n"


println "[DONE] Finish installation, please enjoy!!"
echo -e "
     _         _                    _          _ _
    | |_ _   _| |__   ___       ___| |__   ___| | |
    | __| | | | '_ \\ / _ \\_____/ __| '_ \\ / _ \\ | |
    | |_| |_| | |_) |  __/_____\\__ \\ | | |  __/ | |
     \\__|\\__,_|_.__/ \\___|     |___/_| |_|\\___|_|_|"
