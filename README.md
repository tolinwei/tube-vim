tube-vim
============
```
             _         _                     _
            | |_ _   _| |__   ___     __   _(_)_ __ ___
            | __| | | | '_ \ / _ \____\ \ / / | '_ ` _ \
            | |_| |_| | |_) |  __/_____\ V /| | | | | | |
             \__|\__,_|_.__/ \___|      \_/ |_|_| |_| |_|
```
**tube-vim** is a integrated Vim development environment that you can easily set up by cloning this repo and running a single bash script inside it. It includes decent color scheme [gruvbox](https://github.com/morhetz/gruvbox) and [gruvbox-generalized](https://github.com/morhetz/gruvbox-generalized) for both of Vim and [iTerm2](http://iterm2.com/) (if you're using OS X), best practical Vim setting with a bunch of must-have plugins managed by [Vundle](https://github.com/gmarik/Vundle.vim). The plugins used will be listed and explained below.

Currently, I can only support for OS X by `install-os-x.sh`, there are files `install-apt-get.sh` and `install-yum.sh` inside thie repo that are intended for *nix operating systems, they're mostly working on newest distributions. However, due to so many of them, I don't have time to make sure they will be working all the time, pull request is welcomed.

## Installation
- (Optional) Strongly recommend to install [iTerm2](https://iterm2.com/index.html) ([direct link](https://iterm2.com/downloads/stable/iTerm2_v2_0.zip)) as Terminal replacement since this repo includes color scheme spesifically for it
- Run `echo $SHELL` in terminal/iTerm2 to make sure you're using `bash`
- Clone this project to anywhere locally, cd into it and then run `./install-os-x.sh`
- (Optional) If you find [tmux](http://tmux.sourceforge.net/), which is a terminal multiplexer, more useful over built-in *screen*, you can run `sudo ./install-tmux.sh` to get it set up. Similarily, the successful compilation is not promised

## What's included

## Preview

![Java preview](https://raw.githubusercontent.com/tolinwei/dev-config/master/preview/bashrc-pre.png)
![shell preview](https://raw.githubusercontent.com/tolinwei/dev-config/master/preview/shell-pre.png)

## Why tube-vim
I started this project when I was working on a Yahoo! Japan's audience data pipeline project, which is internally named **Tube**. Since I used most of the settings from within thie repo for that project, later I renamed this as **tube-vim** for a memorial.

[![Analytics](https://ga-beacon.appspot.com/UA-61856209-1/tolinwei/tube-vim)](https://github.com/igrigorik/ga-beacon)

