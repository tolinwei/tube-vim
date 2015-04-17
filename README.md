tube-vim
============
```
    _         _                     _
    | |_ _   _| |__   ___     __   _(_)_ __ ___
    | __| | | | '_ \ / _ \____\ \ / / | '_ ` _ \
    | |_| |_| | |_) |  __/_____\ V /| | | | | | |
    \__|\__,_|_.__/ \___|      \_/ |_|_| |_| |_|
```
**tube-vim** is a integrated shell development environment that you can easily set up by running a single command:
```
bash <(curl -L https://raw.githubusercontent.com/tolinwei/tube-vim/master/install.sh)
```
It includes best practical Vim setting with a bunch of must-have plugins managed by modern [Vundle](https://github.com/gmarik/Vundle.vim), decent color schemes [gruvbox](https://github.com/morhetz/gruvbox) ([gruvbox-terminal](https://github.com/flipxfx/gruvbox-terminal) | [gruvbox-generalized](https://github.com/morhetz/gruvbox-generalized)) and [Solarized](http://ethanschoonover.com/solarized) for both Vim and Terminal/[iTerm2](http://iterm2.com/) (if you're using OS X). The used plugins will be listed and explained below.

Different from other integrated Vim configuration, **tube-vim** also uses Z shell (a true hacker's shell)'s wrapper **oh-my-zsh** ([Github](https://github.com/robbyrussell/oh-my-zsh) | [Official size](http://ohmyz.sh/)) as the replacement of system default bash shell. Due to its full compatibility with bash, you can switch to zsh easily without any learning curse while you can also enjoy a lot new benefits listed [here](https://github.com/robbyrussell/oh-my-zsh/wiki).

In addition, it provides an optional installation of [tmux](), which is a terminal multiplexer that allows you to switch easily between several programs in one terminal, detach them and re-attach them to a different terminal as you want to accelarate your workflow and make your life ealier.

## Preview
- Default color scheme [gruvbox](https://github.com/morhetz/gruvbox) for Vim, iTerm2/Terminal
![gruvbox-bashrc-pre](https://raw.githubusercontent.com/tolinwei/dev-config/master/preview/gruvbox-bashrc-pre.png)
![shell-preview](https://raw.githubusercontent.com/tolinwei/dev-config/master/preview/gruvbox-shell-pre.png)

- Optional color scheme [Solarized dark](http://ethanschoonover.com/solarized)
![solarized-bashrc-preview](https://raw.githubusercontent.com/tolinwei/dev-config/master/preview/solarized-bashrc-pre.png)

- Optional color scheme [Tomorrow-Night](https://github.com/chriskempson/tomorrow-theme)


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
bash <(curl -L https://raw.githubusercontent.com/tolinwei/tube-vim/master/install-tmux.sh)
```
to get it set up. Since it needs some dependencies, the successful compilation of tmux is not promised

### For *nix
**Prerequisite**

- If you're using *nix, we value you as an experienced user, and due to so many variation of *nix distribution, it's nearly impossible to provide a single installation script to cover all the cases. We ask you to have some prerequisites before running the setup script
    + Have [lua](http://www.lua.org/) installed in your system. It is normally included in system's package source and used by [neocopmlete](https://github.com/Shougo/neocomplete.vim) for auto comletion. Type the following command to check installation:
    
        ```
        lua -v
        ```
        
    + Have Vim 7.4 with lua support (to verify this, you can ype `echo has("lua")` inside Vim then check whether the output is `1`, or you can type `vim --version` to see if `+lua` is among the list). A suggested way of installation is to compile from source code in the following way (similarily, the potential error would occur)
    
        ```
        wget ftp://ftp.vim.org/pub/vim/unix/vim-7.4.tar.bz2
        tar jxf vim-7.4.tar.bz2
        cd vim74/
        ./configure --prefix=/usr/local/ --with-features=huge --enable-luainterp
        make && sudo make install
        ```
        
    + Have your `git`, `wget` and other compilation tools installed. In a typical Ubuntu machine, you can normally install them using
    
        ```
        sudo apt-get update
        sudo apt-get upgrade
        sudo apt-get install wget git
        sudo apt-get install build-essential
        ```
        
- Then boom! You can just use the similar command to start the installation
```
bash <(curl -L https://raw.githubusercontent.com/tolinwei/tube-vim/master/install-nix.sh)
```
## Major features and key mappings

（To be Editted）

## Why it's called tube-vim
I started this project when I was working on a Yahoo! Japan's audience data pipeline, which is internally named **Tube**. Since I used most of the settings from within thie repo for that project, later I decided to rename it as **tube-vim** for a memorial.

## Feedback, please!

If you use this repo, please start it on Github, this is a great way of getting feedback! The same as opening issues or pull requests.

Thanks you for enjoying tube-vim!

## License

Copyright © [Wei Lin](http://www.linkedin.com/in/tolinwei). Distributed under the same terms as Vim itself. See `:help license`.

[![Analytics](https://ga-beacon.appspot.com/UA-61856209-1/tolinwei/tube-vim)](https://github.com/igrigorik/ga-beacon)

