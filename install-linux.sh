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
current_time=`date +"%y-%m-%d-%H:%M"`
if [ -e .vimrc ] ; then
    mv .vimrc .vimrc_bak-${current_time}
fi
if [ -d .vim ] ; then
    mv .vim .vim_bak-${current_time}
fi
if [ -e .screenrc ] ; then
    mv .screenrc .screenrc_bak-${current_time}
fi

echo "
################################################################################
## Setting up directories
################################################################################"
cd $HOME_DIR
mkdir -p $DOWNLOAD_DIR

echo "
################################################################################
## Copying configuration files for bash, zhs and coloe scheme for Vim
################################################################################"
cd $PROJECT_DIR
cat bashrc >> ${HOME_DIR}/.bashrc
mkdir -p $VIM_COLOR_DIR
cp gruvbox.vim $VIM_COLOR_DIR
cp zshrc ${HOME_DIR}/.zshrc

echo "
################################################################################
## Installing oh-my-zsh, may need to mannually shell change later
################################################################################"
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

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
cp vimrc ${HOME_DIR}/.vimrc
vim +PluginInstall +qall


echo "
################################################################################
## Compiling YouCompleteMe
################################################################################"
cd $HOME_DIR/.vim/bundle/YouCompleteMe
./install.sh --clang-completer \
             --omnisharp-completer \
             --gocode-completer

echo "
################################################################################
## Installing vimcat
################################################################################"
cd $DOWNLOAD_DIR
git clone git://github.com/rkitover/vimpager
cd vimpager
sudo make install

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

