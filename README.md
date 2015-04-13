tube-vim
============

**tube-vim** is a integrated Vim development environment that you can easily set up by cloning this repo and running a single bash script inside it. It includes decent color scheme [gruvbox](https://github.com/morhetz/gruvbox) and [gruvbox-generalized](https://github.com/morhetz/gruvbox-generalized) for both of Vim and [iTerm2](http://iterm2.com/) (if you're using OS X), best practical Vim setting with a bunch of must-have plugins managed by [Vundle](https://github.com/gmarik/Vundle.vim). The plugins used will be listed below.

## Preview

![Java preview](https://raw.githubusercontent.com/tolinwei/dev-config/master/preview/bashrc-pre.png)
![shell preview](https://raw.githubusercontent.com/tolinwei/dev-config/master/preview/shell-pre.png)

## Installation
- Strongly recommend to install [iTerm2](https://iterm2.com/index.html) as Terminal replacement ([direct link](https://iterm2.com/downloads/stable/iTerm2_v2_0.zip)) if you're using OS X
- Run `echo $SHELL` in iTerm2 to make sure you're using `bash`
- Clone this project to anywhere locally, cd into it and then run `install-xxx.sh` script for you corresponding operating systems:

1. `sudo ./install-os-x.sh` for OS X
2. `sudo ./install-yum.sh` for *nix systems using yum as package management tools like CentOS, Fedora, RHEL and etc.
3. `sudo ./install-apt-get.sh` for *nix using apt-get as PMT like Debian, Ubuntu, Linux Mint and etc.

## What's included



## Why tube-vim
I started this project when I was working on a Yahoo! Japan's audience data pipeline project, which is internally named **Tube**. Since I used most of the settings from within thie repo for that project, later I renamed this as tube-vim for a memorial.

