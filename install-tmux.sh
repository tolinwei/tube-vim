#!/bin/bash
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

