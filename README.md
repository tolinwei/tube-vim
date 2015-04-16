tube-vim
============
```
    _         _                     _
    | |_ _   _| |__   ___     __   _(_)_ __ ___
    | __| | | | '_ \ / _ \____\ \ / / | '_ ` _ \
    | |_| |_| | |_) |  __/_____\ V /| | | | | | |
    \__|\__,_|_.__/ \___|      \_/ |_|_| |_| |_|
```
**tube-vim** is a integrated Shell development environment that you can easily set up by running a single command:
```
bash <(curl -L https://raw.githubusercontent.com/tolinwei/tube-vim/master/install.sh)
```
It includes best practical Vim setting with a bunch of must-have plugins managed by [Vundle](https://github.com/gmarik/Vundle.vim) and decent color schemes [gruvbox](https://github.com/morhetz/gruvbox) and [gruvbox-terminal](https://github.com/flipxfx/gruvbox-terminal)/[gruvbox-generalized](https://github.com/morhetz/gruvbox-generalized) for both Vim and Terminal/[iTerm2](http://iterm2.com/) (if you're using OS X), . The plugins used will be listed and explained below.

Different from other integrated Vim configuration, **tube-vim** also uses Z shell (a true hacker's shell)'s wrapper oh-my-zsh ([Github](https://github.com/robbyrussell/oh-my-zsh) | [Official size](http://ohmyz.sh/)) as the replacement of system default bash shell. Due to its full compatibility to bash, you can switch to zsh easily without any learning curse while you can also enjoy a lot of new benefits listed [here](https://github.com/robbyrussell/oh-my-zsh/wiki).

In addition, it provides an optional installation of [tmux](), which is a terminal multiplexer that allows you to switch easily between several programs in one terminal, detach them and re-attach them to a different terminal as you want to accelarate your workflow and make your life ealier.

## Installation

### For OS X
- (Optional) Strongly recommend to install [iTerm2](https://iterm2.com/index.html) ([direct link](https://iterm2.com/downloads/stable/iTerm2_v2_0.zip)) as Terminal replacement since this repo includes color scheme spesifically for it, and you can enjoy more features not only listed [here](https://iterm2.com/features.html)
- Run the following command to install the environment automatically
```
bash <(curl -L https://raw.githubusercontent.com/tolinwei/tube-vim/master/install.sh)
```
- Change the color scheme for Terminal or iTerm2 depends on which one you're using
    + For Terminal
    
        <img src="https://raw.githubusercontent.com/tolinwei/tube-vim/master/preview/terminal.png" alt="terminal preference" width="400" />
    + For iTerm2
    
        <img src="https://raw.githubusercontent.com/tolinwei/tube-vim/master/preview/iterm2.png" alt="terminal preference" width="500" />

- (Optional) If you find [tmux](http://tmux.sourceforge.net/), which is a terminal multiplexer, more useful over built-in *screen* ([Screen User's Mannual](https://www.gnu.org/software/screen/manual/screen.html)), you can run
```
bash ./.tube-vim/install-tmux.sh
```
to get it set up. Similarily, the successful compilation of tmux is not promised

### For *nix
**Prerequisite**

(Working in Progress)

## What's included

（To be Editted）

## Preview

![Java preview](https://raw.githubusercontent.com/tolinwei/dev-config/master/preview/bashrc-pre.png)
![shell preview](https://raw.githubusercontent.com/tolinwei/dev-config/master/preview/shell-pre.png)

## Why tube-vim
I started this project when I was working on a Yahoo! Japan's audience data pipeline, which is internally named **Tube**. Since I used most of the settings from within thie repo for that project, later I decided to rename it as **tube-vim** for a memorial.

[![Analytics](https://ga-beacon.appspot.com/UA-61856209-1/tolinwei/tube-vim)](https://github.com/igrigorik/ga-beacon)

