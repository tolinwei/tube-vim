#/bin/bash
echo "
################################################################################
##       _         _                     _
##      | |_ _   _| |__   ___     __   _(_)_ __ ___
##      | __| | | | '_ \\ / _ \\____\\ \\ / / | '_ \` _ \\
##      | |_| |_| | |_) |  __/_____\\ V /| | | | | | |
##       \\__|\\__,_|_.__/ \\___|      \\_/ |_|_| |_| |_|
##
################################################################################"

echo "
################################################################################
## Seting up advanced shell environment from within this repo
################################################################################"

echo "
################################################################################
## Defining folder variables
################################################################################"
HOME_DIR=~
PROJECT_DIR=${HOME_DIR}/.tube-vim/
DOWNLOAD_DIR=${HOME_DIR}/Downloads/
VIM_COLOR_DIR=${HOME_DIR}/.vim/colors/
ZSH_THEME_DIR=${HOME_DIR}/.oh-my-zsh/themes/
YCM_DIR=${HOME_DIR}/ycm_build

echo "
################################################################################
## Cloning repo to home directories
################################################################################"
rm -rf $PROJECT_DIR
git clone https://github.com/tolinwei/tube-vim.git $PROJECT_DIR

echo "
################################################################################
## Backing up existing Vim settings if any
################################################################################"
cd $HOME_DIR
date_time=`date +"%y-%m-%d-%H:%M"`
if [ -e .vimrc ] ; then
    mv .vimrc .vimrc.bak-${date_time}
fi
if [ -d .vim ] ; then
    mv .vim .vim.bak-${date_time}
fi
if [ -e .screenrc ] ; then
    mv .screenrc .screenrc.bak-${date_time}
fi
if [ -e .tmux.conf ] ; then
    mv .tmux.conf .tmux.conf.bak-${date_time}
fi

echo "
################################################################################
## Setting up directories
################################################################################"
cd $HOME_DIR
mkdir -p $DOWNLOAD_DIR

echo "
################################################################################
## Installing oh-my-zsh, may need to mannually shell change later
################################################################################"
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "
################################################################################
## Copying configuration files for bash, zhs and coloe scheme for Vim
################################################################################"
cd $PROJECT_DIR
if [ -e .bashrc ] ; then
    mv .bashrc .bashrc.bak-${date_time}
fi
cat bashrc >> ${HOME_DIR}/.bashrc
mkdir -p $VIM_COLOR_DIR
cp gruvbox.vim $VIM_COLOR_DIR
cp zshrc ${HOME_DIR}/.zshrc

echo "
################################################################################
## Installing Vundle for manegement of Vim plugins
################################################################################"
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo "
################################################################################
## Installing Vim plugins defined in vimrc
################################################################################"
cd $PROJECT_DIR
cp vimrc-linux ${HOME_DIR}/.vimrc
vim +PluginInstall +qall

echo "
################################################################################
## Compiling ycm_support_libs, then compile YouCompleteMe
################################################################################"
mkdir -p $YCM_DIR
cd $YCM_DIR
cmake -G "Unix Makefiles" . ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp
make ycm_support_libs
cd $HOME_DIR/.vim/bundle/YouCompleteMe
./install.sh

echo "
################################################################################
## Finish installation!!
## Please enjoy --------
################################################################################
##       _         _                     _
##      | |_ _   _| |__   ___     __   _(_)_ __ ___
##      | __| | | | '_ \\ / _ \\____\\ \\ / / | '_ \` _ \\
##      | |_| |_| | |_) |  __/_____\\ V /| | | | | | |
##       \\__|\\__,_|_.__/ \\___|      \\_/ |_|_| |_| |_|
##
################################################################################"

