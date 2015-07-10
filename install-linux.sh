#/bin/bash

echo -e "
     _         _                     _
    | |_ _   _| |__   ___     __   _(_)_ __ ___
    | __| | | | '_ \\ / _ \\____\\ \\ / / | '_ \` _ \\
    | |_| |_| | |_) |  __/_____\\ V /| | | | | | |
     \\__|\\__,_|_.__/ \\___|      \\_/ |_|_| |_| |_|\n"

echo -e "## [START] Seting up shell-based development environment from within this repo...\n"



echo -e "## [STAGE] Defining folder variables..."
HOME_DIR=~
PROJECT_DIR=${HOME_DIR}/.tube-vim/
PROJECT_COLOR_DIR=${PROJECT_DIR}/colors
PROJECT_CONFIG_DIR=${PROJECT_DIR}/config

DOWNLOAD_DIR=${HOME_DIR}/Downloads/
VIM_COLOR_DIR=${HOME_DIR}/.vim/colors/
ZSH_THEME_DIR=${HOME_DIR}/.oh-my-zsh/themes/
echo -e "## [STAGE] ...Done\n"



echo -e "## [STAGE] Cloning repo to home directories..."
rm -rf $PROJECT_DIR
git clone https://github.com/tolinwei/tube-vim.git $PROJECT_DIR
echo -e "## [STAGE] ...Done\n"


echo -e "## [STAGE] Backing up existing Vim, screen, tmux settings and bashrc..."
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
    mv .screenrc .screenrc.bak-${date_time}
fi
if [ -e .tmux.conf ] ; then
    echo -e "## [INFO] Backing up .tmux.conf to .tmux.conf.bak-${date_time}"
    mv .tmux.conf .tmux.conf.bak-${date_time}
fi
if [ -e .bashrc ] ; then
    echo -e "## [INFO] Backing up .bashrc to .bashrc.bak-${date_time}"
    mv .bashrc .bashrc.bak-${date_time}
fi
echo -e "## [STAGE] ...Done\n"



echo -e "## [STAGE] Setting up directories..."
mkdir -p $DOWNLOAD_DIR
echo -e "## [STAGE] ...Done\n"



echo -e "## [STAGE] Copying configuration file for bash, tmux, screen and color scheme for Vim..."
cd $PROJECT_CONFIG_DIR
cat bashrc >> ${HOME_DIR}/.bashrc
cp tmux.conf ${HOME_DIR}/.tmux.conf
cp screenrc ${HOME_DIR}/.screenrc

mkdir -p $VIM_COLOR_DIR
cd $PROJECT_COLOR_DIR
cp gruvbox.vim $VIM_COLOR_DIR
echo -e "## [STAGE] ...Done\n"



echo -e "## [STAGE] Installing Vundle for manegement of Vim plugins..."
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
echo -e "## [STAGE] ...Done\n"



echo -e "## [STAGE] Installing Vim plugins defined in vimrc..."
cd $PROJECT_CONFIG_DIR
cp vimrc-linux ${HOME_DIR}/.vimrc
vim +PluginInstall +qall
echo -e "## [STAGE] ...Done\n"



#echo -e "## Compiling ycm_support_libs, then compile YouCompleteMe..."
#mkdir -p $YCM_DIR
#cd $YCM_DIR
#cmake -G "Unix Makefiles" . ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp
#make ycm_support_libs
#cd $HOME_DIR/.vim/bundle/YouCompleteMe
#./install.sh



echo -e "## [STAGE] Installing oh-my-zsh, and copying configuration file..."
echo -e "\n## [INFO] **PLEASE TYPE 'exit' AFTER OH-MY-ZSH INSTALLATION, THEN RE-LOGIN**\n"

if [ -d ${HOME_DIR}/.oh-my-zsh ]; then
    echo -e "## [INFO] Deleting existing oh-my-zsh and installing new one"
    rm -rf ${HOME_DIR}/.oh-my-zsh
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
else
    echo -e "## [INFO] Installing new oh-my-zsh only"
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi
cd $PROJECT_CONFIG_DIR
cp zshrc ${HOME_DIR}/.zshrc
echo -e "## [STAGE] ...Done\n"



echo -e "## [DONE] Finish installation, please enjoy!!"
echo -e "
     _         _                     _
    | |_ _   _| |__   ___     __   _(_)_ __ ___
    | __| | | | '_ \\ / _ \\____\\ \\ / / | '_ \` _ \\
    | |_| |_| | |_) |  __/_____\\ V /| | | | | | |
     \\__|\\__,_|_.__/ \\___|      \\_/ |_|_| |_| |_|\n"


