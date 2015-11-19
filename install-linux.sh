#/bin/bash

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


echo -e "## [STAGE] Cloning repo to home directories..."
rm -rf $PROJECT_DIR
git clone https://github.com/tolinwei/tube-vim.git $PROJECT_DIR
echo -e "## [STAGE] ...Done\n"


println "[Info] Backing up existing Vim, screen, tmux settings and bashrc..."
cd $HOME_DIR
date_time=`date +"%y-%m-%d-%H:%M"`
if [ -e .vimrc ]; then
    println "[Info] Backing up .vimrc to .vimrc.bak-${date_time}"
    mv .vimrc .vimrc.bak-${date_time}
fi
if [ -d .vim ]; then
    println "[Info] Backing up .vim directory to .vim.bak-${date_time}"
    mv .vim .vim.bak-${date_time}
fi
if [ -e .screenrc ]; then
    println "[Info] Backing up .screenrc to .screenrc.bak-${date_time}"
    mv .screen .screenrc.bak-${date_time}
fi
if [ -e .tmux.conf ]; then
    println "[Info] Backing up .tmux.conf to .tmux.conf.bak-${date_time}"
    mv .tmux.conf .tmux.conf.bak-${date_time}
fi
if [ -e .bashrc ]; then
    println "[Info] Skipping .bashrc as it's existed"
fi
println "[Info] ...Done"


println "[Info] Copying configuration file for bash, tmux, screen and color scheme for Vim..."
cd $PROJECT_CONFIG_DIR
if [ ! -f ${HOME_DIR}/.bashrc ]; then
    cp bashrc ${HOME_DIR}/.bashrc
fi
cp tmux.conf ${HOME_DIR}/.tmux.conf
cp screenrc ${HOME_DIR}/.screenrc

mkdir -p $VIM_COLOR_DIR
cd $PROJECT_COLOR_DIR
cp gruvbox.vim $VIM_COLOR_DIR
println "[Info] ...Done"


println "[Info] Installing junegunn/vim-plug as Vim plugins manager..."
# if [ ! -d ${HOME_DIR}/.vim/bundle/Vundle.vim ]; then
#     git clone https://github.com/gmarik/Vundle.vim.git ${HOME_DIR}/.vim/bundle/Vundle.vim
# fi
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
println "[Info] ...Done"


println "[Info] Installing Vim plugins defined in vimrc..."
cd $PROJECT_CONFIG_DIR
cp vimrc-linux ${HOME_DIR}/.vimrc
vim +PlugInstall +qa
# vim +PluginInstall +qall
println "[Info] ...Done\n"


println "[DONE] Finish installation, please enjoy!!"
echo -e "
     _         _                     _
    | |_ _   _| |__   ___     __   _(_)_ __ ___
    | __| | | | '_ \\ / _ \\____\\ \\ / / | '_ \` _ \\
    | |_| |_| | |_) |  __/_____\\ V /| | | | | | |
     \\__|\\__,_|_.__/ \\___|      \\_/ |_|_| |_| |_|\n"


