#!/bin/bash
echo "
###########################################################################
## Defining folder variables
###########################################################################"
PROJECT_FOLDER=$( cd "$( dirname "${BASH_SOURCE[0]}"  )" && pwd  )

echo "
###########################################################################
## Backing up existing tmux settings if any
###########################################################################"
cd ~/
if [ -e .tmux.conf ]; then mv .tmux.conf .tmux.conf_bak; fi

echo "
###########################################################################
## Copying configuration files for tmux
###########################################################################"
cd $PROJECT_FOLDER
cp tmux.conf ~/.tmux.conf

echo "
###########################################################################
## Installing libevent as dependency of tmux
###########################################################################"
cd $DOWNLOAD_FOLDER
wget https://sourceforge.net/projects/levent/files/libevent/libevent-2.0/libevent-2.0.22-stable.tar.gz
tar zxf libevent-2.0.22-stable.tar.gz
cd libevent-2.0.22-stable/
./configure --prefix=/usr/local/
make && sudo make install  # sudo required

echo "
###########################################################################
## Installing tmux compiled from source code
###########################################################################"
cd $DOWNLOAD_FOLDER
wget http://downloads.sourceforge.net/tmux/tmux-1.9a.tar.gz
tar zxf tmux-1.9a.tar.gz
cd tmux-1.9a
./configure -LDFLAGS="-L/usr/local/lib -Wl,-rpath=/usr/local/lib" -prefix=/usr/local
make && sudo make install  # sudo required

