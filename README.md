tube-vim
============
```
     _         _                     _
    | |_ _   _| |__   ___     __   _(_)_ __ ___
    | __| | | | '_ \ / _ \____\ \ / / | '_ ` _ \
    | |_| |_| | |_) |  __/_____\ V /| | | | | | |
     \__|\__,_|_.__/ \___|      \_/ |_|_| |_| |_|
         
```

**tube-vim** is a integrated shell-based development environment that you can easily set up by **running a single command**:

```
bash <(curl -L https://raw.githubusercontent.com/tolinwei/tube-vim/master/install.sh)
```

It includes best practical Vim setting and a bunch of must-have **plugins** managed by modern **[Vundle](https://github.com/gmarik/Vundle.vim)**, together with decent color schemes **[gruvbox](https://github.com/morhetz/gruvbox)** ([gruvbox-terminal](https://github.com/flipxfx/gruvbox-terminal) | [gruvbox-generalized](https://github.com/morhetz/gruvbox-generalized)). The used plugins will be listed and explained below.

Different from other Vim configuration, **tube-vim** also uses Z shell (zsh)'s wrapper **oh-my-zsh** ([Github](https://github.com/robbyrussell/oh-my-zsh) | [Official size](http://ohmyz.sh/)) as the replacement of system default bash shell. Due to its full compatibility with bash, you can switch to zsh easily without too much learning curve while you can also enjoy a lot new benefits listed [here](https://github.com/robbyrussell/oh-my-zsh/wiki).

We also help you to install **[tmux](http://tmux.github.io/)** (for OS X only, Linux users have to install it manually), which is a terminal multiplexer, together with its configuration file `.tmux.conf`, to helps you manage, accelerate and stream your shell operation in a unbelievable way. If you're not in favor of tmux, a **`screen`** configuration file `.screenrc` will be placed during the installation that helps you to have better control of it.

## Preview
![gruvbox-bashrc-pre](https://raw.githubusercontent.com/tolinwei/dev-config/master/preview/gruvbox-bashrc-pre.png)
![shell-preview](https://raw.githubusercontent.com/tolinwei/dev-config/master/preview/gruvbox-shell-pre.png)

## Installation

### For OS X
1. (Optional) Strongly recommend to install **[iTerm2](https://iterm2.com/index.html)** ([direct link](https://iterm2.com/downloads/stable/iTerm2_v2_0.zip)) as Terminal replacement since this repo includes color scheme spesifically for it, and you can enjoy more features not only [here](https://iterm2.com/features.html)

2. Run the following command to install the environment automatically.
     ```
     bash <(curl -L https://raw.githubusercontent.com/tolinwei/tube-vim/master/install.sh)
     ```

3. Change the color scheme for **Terminal** or **iTerm2** depends on which one you're using.
    + For Terminal
    
        <img src="https://raw.githubusercontent.com/tolinwei/tube-vim/master/preview/terminal.png" alt="terminal preference" width="400" />
    + For iTerm2
    
        <img src="https://raw.githubusercontent.com/tolinwei/tube-vim/master/preview/iterm2.png" alt="terminal preference" width="500" />

4. (Optional) Until now, you have most of the power of this repository, **except Java auto completion** support inside Vim. If you do need this, try to read **[Semantic completion for other languages](https://github.com/Valloric/YouCompleteMe#semantic-completion-for-other-languages)** in [YouCompleteMe](https://github.com/Valloric/YouCompleteMe)'s Github README. You bascally need to have latest Eclim and Ecplipse installed (this means Eclim >= 2.2.* and Eclipse >= 4.2.*) and some extra steps to have this supported.

### For Linux

－ If you're using Linux, we value you as experienced user, and ask you to have some prerequisites before running the setup script. Except this, due to so many Linux distributions, it's nearly impossible to provide a single installation script to cover all the funcions as that of OS X, we only provide a simplified version that covers color scheme, most Vim plugins except [YouCompleteMe](https://github.com/Valloric/YouCompleteMe) for auto completion, and remove tmux installation.

1. Have your `git` and other compilation tools installed. In a typical **Ubuntu** machine, you can install them using

     ```
     sudo apt-get update
     sudo apt-get upgrade
     sudo apt-get install git
     ```
     
2. Have Vim at least 7.3 installed (7.4 is recommanded). You may try to install it via the software manager (like `apt-get` of Debian-like Linux) using `sudo apt-get install vim` or `sudo yum install vim` or others depending on what OS you're running, and then type `vim -version` to print out the version on console.

     Some of the Linux distributions include older version of Vim (< 7.3) in software manager's repositories, you may consider to compile, make and install it from source code.

     ```
     sudo mkdir ~/Downloads
     cd ~/Downloads
     wget ftp://ftp.vim.org/pub/vim/unix/vim-7.4.tar.bz2
     tar jxf vim-7.4.tar.bz2
     cd vim74/
     ./configure --prefix=/usr/local/ \
                 --with-features=huge \
                 --enable-multibyte \
                 --enable-rubyinterp \
                 --enable-pythoninterp \
                 --enable-perlinterp \
                 --enable-luainterp \
                 --enable-cscope
     make && sudo make install
     ```
     
     If you encounter issues during Vim installation, or you need some instruction for other Linux distributions, try refer to this **[Building Vim from Source](https://github.com/Valloric/YouCompleteMe/wiki/Building-Vim-from-source)** in YouCompleteMe's Github wiki.
       
3. Install **zsh**, ideally also from software manger using like `sudo apt-get install zsh` or `sudo yum install zsh` or others. If you fail at certain point, try to follow this **[Installing ZSH(https://github.com/robbyrussell/oh-my-zsh/wiki/Installing-ZSH)** in oh-my-zsh's Github wiki page.

     If you don't do this step successfully, you would encounter some errors when the installtion script of this repository tries to set `zsh` as your system's default shell.

4. Then you can just use the similar command to start the installation.
 
     ```
     bash <(wget -O - https://raw.githubusercontent.com/tolinwei/tube-vim/master/install-linux.sh)
     ```
     
5. (Optional) If you want to use *tmux*, try also to install it via your system's software manager using `sudo apt-get install tmux` or `sudo yum install tmux` or others, or go to the **[official site](http://tmux.github.io/)** to download source code and compile it.
     
     If you choose to compile it from the newset version of source code, most likely you will fail due to some of the system's packages are outdated, try to search for solutions, maybe like this [one](https://gist.github.com/shime/5706655), but the successful compilation can not be promised.

6. (Optional) If you need auto completion for Vim, refer to **[YouCompleteMe's Github page](https://github.com/Valloric/YouCompleteMe)** to see how to install it mannually. You basically need to add one line `Plugin 'Valloric/YouCompleteMe` in you **vimrc** file, download it using our pre-configured [Vundle](https://github.com/gmarik/Vundle.vim) and go to `~/.vim/bundle/YouCompleteMe` to execute `./install.sh`. It should be easy to set up on most famous distributions, however, if you run into some problem, you may have to read the [Full Installtion Guide](https://github.com/Valloric/YouCompleteMe#full-installation-guide) and possibly the [FAQ](https://github.com/Valloric/YouCompleteMe#faq) section below.


## Major features and key mappings

####>>> Color Schemes <<<
We prepared color schemes **[gruvbox](https://github.com/morhetz/gruvbox)** ([gruvbox-terminal](https://github.com/flipxfx/gruvbox-terminal) | [gruvbox-generalized](https://github.com/morhetz/gruvbox-generalized)), which is all fantastic and eye-protective for you.

####>>> Vundle <<<
**tube-vim** is using **[Vundle](https://github.com/gmarik/Vundle.vim)** as the plugin management tool, it allows you to keep track of and configure your plugins right inside `.vimrc` file, so that you can download all the plugins in one command if you change your development environment, of course you can also update, clean them conveniently.

**Commands**
- Enter Vim and then run `:PluginInstall` to install plugins defined in your `.vimrc`
- Run `vim +PluginInstall +qall` from shell for installation too
- Run `:PluginList` from within Vim or `vim +PluginList` to show the installed plugin(s), move your cursor to certain plugin, press D (Shift+d) to delete that plugin

####>>> vim-airline <<<
**[vim-airline](https://github.com/tolinwei/vim-airline)** is a super pretty lean & mean status/tabline that's light as air, which is regarded as the replacement of deprecated [vim-powerline](https://github.com/Lokaltog/vim-powerline). It is integrated with plugins like [NERDTree](https://github.com/scrooloose/nerdtree) and [Tagbar](https://github.com/majutsushi/tagbar). We tweaked a little bit of the theme we're using and make it more clear when switching between NORMAL mode and INSERT mode.

####>>> NERDTree <<<
**[NERDTree](https://github.com/scrooloose/nerdtree)** is a file explorer taht allows you to explore your filesystem and to open files or directories. It presents the filesystem to you in the form of a tree in which you can manipulate with the keyboard or mouse (GUI vims like [macvim](https://github.com/b4winckler/macvim)).

**Shortcuts**

- `<Control>+n` - Toggle NERDTree
- `<Control>+w` then `w` - Switch between panes of Vim
- `<Control>+w` then `<left>` - Switch to the left pane of Vim
- `<Control>+w` then `<right>` - Switch to the right pane of Vim

when your cursor is in NERDTree's pane
- `o` or `<Enter>` - Open that file or expend that directory the cursor points to
- `R` (`<Shift>+r`) - Refresh the tree, useful if files change outside of Vim
- `U` (`<Shift>+u`) - Show upper level directory

For more shortcuts, please refer to a external [NERDTree Guide](http://usevim.com/2012/07/18/nerdtree/)

####>>> Indent Guides <<<
**[vim-indent-guides](https://github.com/nathanaelkane/vim-indent-guides)** is a plugin for visually displaying indent levels in Vim. Plus, you can fold your function or logic trunk (like `if` or `else` statements), by the deepest level of indent guides.

**Shortcuts**

- `z then a` - Fold or un-fold the code trunk, by the deepest level of indent guide

####>>> Tagbar <<<
**[Tagbar](https://github.com/majutsushi/tagbar)** is a Vim plugin as class outline viewer, which provides a easy way to browse the tags (variable names, function/method names and etc.) of current file and get a overview of its structure). It does this by creating a sidebar (on the right side by default) the displays the ctags-generated tags of current file, ordered by their scope.

**Shortcuts**

- `<Control>+t` - Toggle Tagbar

####>>> Rainbow Parentheses / Auto Pairs <<<
Complex code may come with multiple level of parenthesis and quote (includes but not only (), [], ""), the first plugin **[rainbow_parentheses.vim](https://github.com/kien/rainbow_parentheses.vim)** helps you to highlight the same level of parentheses, using the color according to based on their levels, and our default theme of Vim [gruvbox](https://github.com/morhetz/gruvbox) adds extra support for it to make the highlighted colors fit together with the theme itself. The later one **[auto-pairs](https://github.com/jiangmiao/auto-pairs)** similates the behaviors of most IDEs that close the parenthesis or quote for you artificially according to multiple scenarios. Check out their official sites for more informations.

####>>> accelerated-smooth-scroll <<<
The default behavior of scrolling inside Vim would jump for the whole page (`<Control>+f` or `<Control>+b`) or half page instantly, it somehow makes it hard to track the position of your cursor and the lines you're focusing on. The plugin **[accelerated-smooth-scroll](https://github.com/yonchu/accelerated-smooth-scroll)** enable the scrolling with a smooth animation. Moreover, the scrolling speed will be increased if you consecutively scroll.

####>>> NERDCommenter <<<
**[NERDCommenter](https://github.com/scrooloose/nerdcommenter)** helps you to comment or umcomment multiples line conveniently according to the type of file you're editting.

**Notes** that not all the shortcuts listed in [official Github repo](https://github.com/scrooloose/nerdcommenter) are working for some reason, the ones listed below are what we're mostly use, if you have new requirement, please open issues.

**Shortcuts**

`<Leader>` means `,` in current setting, you can modify this by changing the 138 line of your `.vimrc` configuration file.

- `<Leader>+c+c` - Comment the line(s) you selected
- `<Leader>+c+u` - Un-comment the line(s) you selected
- `<Leader>+c+c` - Toggle the comment status of selected line(s)
- `<Leader>+c+y` - Same as <Leader>+c+c expect that the commented line(s) are yanked first
- `<Leader>+c+A` - Add comment delimiter to the end of current line and go into INSERT mode

####>>> YouCompleteMe <<<
I'm migrating to **[YouCompleteMe](https://github.com/Valloric/YouCompleteMe)** from **[neocomplete.vim](https://github.com/Shougo/neocomplete.vim)** as the auto completion plugin.

YouCompleteMe by default provides auto completion support of C-family language, Python, C# and Go natively using [Jedi](https://github.com/davidhalter/jedi), [Omnisharp](https://github.com/OmniSharp/omnisharp-server), [Gocode](https://github.com/nsf/gocode). "YCM will use your omnifunc (see :h omnifunc in Vim) as a source for semantic completions if it does not have a native semantic completion engine for your file's filetype".

If you want **Java** auto completion suppport, which might be needed by some users, you would have to mannually follow the official guide [here](https://github.com/Valloric/YouCompleteMe#semantic-completion-for-other-languages), to install Ecplise for Java and [Eclim](http://eclim.org/) for accessing Eclipse code editing feature.

## Why it is tube-vim
I started this project when I was working on a Yahoo! Japan's audience data pipeline, which is internally named **Tube**. Since I used most of the settings from within thie repo for that project, later I decided to rename it as **tube-vim** as a memorial.

## License

Copyright © [Wei Lin](http://www.linkedin.com/in/tolinwei). Distributed under the same terms as Vim itself. See `:help license`.

[![Analytics](https://ga-beacon.appspot.com/UA-61856209-1/tolinwei/tube-vim)](https://github.com/igrigorik/ga-beacon)

