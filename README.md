tube-vim
============
```
     _         _                     _
    | |_ _   _| |__   ___     __   _(_)_ __ ___
    | __| | | | '_ \ / _ \____\ \ / / | '_ ` _ \
    | |_| |_| | |_) |  __/_____\ V /| | | | | | |
     \__|\__,_|_.__/ \___|      \_/ |_|_| |_| |_|
         
```

**tube-vim** is a integrated shell development environment that you can easily set up by **running a single command**:
```
bash <(curl -L https://raw.githubusercontent.com/tolinwei/tube-vim/master/install.sh)
```
It includes best practical Vim setting with a bunch of must-have plugins managed by modern [Vundle](https://github.com/gmarik/Vundle.vim), decent color schemes [gruvbox](https://github.com/morhetz/gruvbox) ([gruvbox-terminal](https://github.com/flipxfx/gruvbox-terminal) | [gruvbox-generalized](https://github.com/morhetz/gruvbox-generalized)) and [Solarized](http://ethanschoonover.com/solarized) for both Vim and Terminal/[iTerm2](http://iterm2.com/) (if you're using OS X). The used plugins will be listed and explained below.

Different from other integrated Vim configuration, **tube-vim** also uses Z shell (a true hacker's shell)'s wrapper **oh-my-zsh** ([Github](https://github.com/robbyrussell/oh-my-zsh) | [Official size](http://ohmyz.sh/)) as the replacement of system default bash shell. Due to its full compatibility with bash, you can switch to zsh easily without any learning curse while you can also enjoy a lot new benefits listed [here](https://github.com/robbyrussell/oh-my-zsh/wiki).

In addition, it provides an optional installation of [tmux](), which is a terminal multiplexer that allows you to switch easily between several programs in one terminal, detach them and re-attach them to a different terminal as you want to accelarate your workflow and make your life easier.

## Preview
- Default color scheme [gruvbox](https://github.com/morhetz/gruvbox) for Vim, iTerm2/Terminal
![gruvbox-bashrc-pre](https://raw.githubusercontent.com/tolinwei/dev-config/master/preview/gruvbox-bashrc-pre.png)
![shell-preview](https://raw.githubusercontent.com/tolinwei/dev-config/master/preview/gruvbox-shell-pre.png)

- Optional color scheme [Solarized Dark](http://ethanschoonover.com/solarized)
![solarized-bashrc-preview](https://raw.githubusercontent.com/tolinwei/dev-config/master/preview/solarized-bashrc-pre.png)

## Installation

### For OS X
- (Optional) Strongly recommend to install [iTerm2](https://iterm2.com/index.html) ([direct link](https://iterm2.com/downloads/stable/iTerm2_v2_0.zip)) as Terminal replacement since this repo includes color scheme spesifically for it, and you can enjoy more features not only [here](https://iterm2.com/features.html)
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
        
__Installation for *nix__
- Then boom! You can just use the similar command to start the installation
```
bash <(curl -L https://raw.githubusercontent.com/tolinwei/tube-vim/master/install-nix.sh)
```
## Major features and key mappings

####- Color Schemes
We prepared two sets of color schemes **[gruvbox](https://github.com/morhetz/gruvbox)** ([gruvbox-terminal](https://github.com/flipxfx/gruvbox-terminal) | [gruvbox-generalized](https://github.com/morhetz/gruvbox-generalized)) and **[Solarized](http://ethanschoonover.com/solarized)** (refer to the screenshot above), which are all pretty fantastic and eye-protective for you. **Notes that** if you want to switch over from one to the other, remember to changev **both** Vim and Terminal/iTerm2's color theme, or there might be some conflict.

The method of changing Vim color scheme is go to edit your `.vimrc`, keep either line 6 or line 12 un-commented and the other one commented. Then go to **Preferences...** of your Terminal (or iTerms), change the color as the installation process above.

####- Vundle
**tube-vim** is using **[Vundle](https://github.com/gmarik/Vundle.vim)** as the plugin management tool, it allows you to kkep track of and configure your plugins right inside `.vimrc` file and you can download all the plugins in one command if you change your development environment, of course you can also update, clean conviniently.

**Commands**
- Enter Vim and then run `:PluginInstall` to install plugins defined in your `.vimrc`
- Run `vim +PluginInstall +qall` from shell for installation too
- Run `:PluginList` from within Vim or `vim +PluginList` to show the installed plugin(s), move your cursor to certain plugin, press D (Shift+d) to delete that plugin

####- vim-airline
**[vim-airline](https://github.com/tolinwei/vim-airline)** is a super pretty lean & mean status/tabline that's light as air, which is regarded as the replacement of deprecated [vim-powerline](https://github.com/Lokaltog/vim-powerline). It is integrated with plugins like [NERDTree](https://github.com/scrooloose/nerdtree) and [Tagbar](https://github.com/majutsushi/tagbar). We tweaked a little bit of the theme we're using and make it more clear when switching between NORMAL mode and INSERT mode.

####- NERDTree
**[NERDTree](https://github.com/scrooloose/nerdtree)** is a file explorer taht allows you to explore your filesystem and to open files or directories. It presents the filesystem to you in the form of a tree in which you can manipulate with the keyboard or mouse (GUI vims like [macvim](https://github.com/b4winckler/macvim)).

**Shortcuts**

- `<Control>+n` - Toggle NERDTree
- `<Control>+w` then `w` - Switch between panes of Vim
- `<Control>+w` then `<left>` - Switch to the left pane of Vim
- `<Control>+w` then `<right>` - Switch to the right pane of Vim

when your cursor is in NERDTree's pane
- `o` - Open that file or expend that directory the cursor points to
- `R` (`<Shift>+r`) - Refresh the tree, useful if files change outside of Vim
- `U` (`<Shift>+u`) - Show upper level directory

For more shortcuts, please refer to a [NERDTree Guide](http://usevim.com/2012/07/18/nerdtree/)

####- vim-indent-guides
**[vim-indent-guides](https://github.com/nathanaelkane/vim-indent-guides)** is a plugin for visually displaying indent levels in Vim. Plus, you can fold your function or logic trunk (like `if` or `else` statements), by the deepest level of indent guides.

**Shortcuts**

- `z then a` - Fold or un-fold the code trunk, by the deepest level of indent guide

####- Tagbar
**[Tagbar](https://github.com/majutsushi/tagbar)** is a Vim plugin as class outline viewer, which provides a easy way to browse the tags (variable names, function/method names and etc.) of current file and get a overview of its structure). It does this by creating a sidebar (on the right side by default) the displays the ctags-generated tags of current file, ordered by their scope.

**Shortcuts**

- `<Control>+t` - Toggle Tagbar

####- rainbow_parentheses.vim / auto-pairs
Complex code may come with multiple level of parenthesis and quote (includes but not only (), [], ""), the first plugin **[rainbow_parentheses.vim](https://github.com/kien/rainbow_parentheses.vim)** helps you to highlight the same level of parentheses, using the color according to based on their levels, and our default theme of Vim [gruvbox](https://github.com/morhetz/gruvbox) adds extra support for it to make the highlighted colors fit together with the theme itself. The later one **[auto-pairs](https://github.com/jiangmiao/auto-pairs)** similates the behaviors of most IDEs that close the parenthesis or quote for you artificially according to multiple scenarios. Check out their official sites for more informations.

####- accelerated-smooth-scroll
The default behavior of scrolling inside Vim would jump for the whole page (`<Control>+f` or `<Control>+b`) or half page instantly, it somehow makes it hard to track the position of your cursor and the lines you're focusing on. The plugin **[accelerated-smooth-scroll](https://github.com/yonchu/accelerated-smooth-scroll)** enable the scrolling with a smooth animation. Moreover, the scrolling speed will be increased if you consecutively scroll.

####- NERDCommenter
**[NERDCommenter](https://github.com/scrooloose/nerdcommenter)** helps you to comment or umcomment multiples line conveniently according to the type of file you're editting.

**Notes** that not all the shortcuts listed in [official Github repo](https://github.com/scrooloose/nerdcommenter) are working for some reason, the ones listed below are what we're mostly use, if you have new requirement, please open issues.

**Shortcuts**

`<Leader>` means `,` in current setting, you can modify this by changing the 138 line of your `.vimrc` configuration file.

- `<Leader>+c+c` - Comment the line(s) you selected
- `<Leader>+c+u` - Un-comment the line(s) you selected
- `<Leader>+c+c` - Toggle the comment status of selected line(s)
- `<Leader>+c+y` - Same as <Leader>+c+c expect that the commented line(s) are yanked first
- `<Leader>+c+A` - Add comment delimiter to the end of current line and go into INSERT mode

####- neocomplete.vim
This is the most amazing part of those plugins! It increases the power of Vim significantly to enable the auto-completion function that is similar to most IDEs.

**Shortcuts**

- `<Tab>` or `<Enter>` - Select the chosen option in popup menu
- `<Up>` or `<Down>` - Move selected option in popup menu up or down 
- `<Control>+p` or `<Control>+n` - The same as \<Up\> or \<Down\>
- `<Control>+e` - Close the popup menu
- `<Control>+l` - Enter the next letter of the chosen option in popup menu

## Why it is tube-vim
I started this project when I was working on a Yahoo! Japan's audience data pipeline, which is internally named **Tube**. Since I used most of the settings from within thie repo for that project, later I decided to rename it as **tube-vim** for a memorial.

## License

Copyright © [Wei Lin](http://www.linkedin.com/in/tolinwei). Distributed under the same terms as Vim itself. See `:help license`.

[![Analytics](https://ga-beacon.appspot.com/UA-61856209-1/tolinwei/tube-vim)](https://github.com/igrigorik/ga-beacon)

