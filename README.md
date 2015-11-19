tube-vim
============
```
     _         _                     _
    | |_ _   _| |__   ___     __   _(_)_ __ ___
    | __| | | | '_ \ / _ \____\ \ / / | '_ ` _ \
    | |_| |_| | |_) |  __/_____\ V /| | | | | | |
     \__|\__,_|_.__/ \___|      \_/ |_|_| |_| |_|
         
```

**tube-vim** is a integrated command line environment mainly designed for OS X. You can install it by **running a single command**:
```
bash <(curl -L https://raw.githubusercontent.com/tolinwei/tube-vim/master/install.sh)
```
**tube-vim** includes best practical Vim settings, bunch of Vim plugins managed by [junegunn/vim-plug](https://github.com/junegunn/vim-plug), and decent color scheme [gruvbox](https://github.com/morhetz/gruvbox) ([gruvbox-terminal](https://github.com/flipxfx/gruvbox-terminal) & [gruvbox-generalized](https://github.com/morhetz/gruvbox-generalized) for Terminal & iTerm2). 

**tube-vim** also installs Z shell `zsh`'s wrapper oh-my-zsh ([Github](https://github.com/robbyrussell/oh-my-zsh) | [Official size](http://ohmyz.sh/)) as the replacement of system's default `bash`. You can switch to it easily due to its full compatibility to `bash`.

As a supplement, [tmux](http://tmux.github.io/) (OS X only), a terminal multiplexer, will be installed to accerate your operation. If you feel `screen` better than `tmux`, a configuration for the former is also provided to help you manage the sessions.

[简体中文文档正在编辑中]()

## Preview
<img src="https://raw.githubusercontent.com/tolinwei/dev-config/master/preview/gruvbox-bashrc-pre.png" width="700">
<img src="https://raw.githubusercontent.com/tolinwei/dev-config/master/preview/gruvbox-shell-pre.png" width="700">

## Installation

### For OS X
1. (Optional) Install **[iTerm2](https://iterm2.com/index.html)** ([direct link](https://iterm2.com/downloads/stable/iTerm2_v2_0.zip)) as Terminal replacement, check out more features [here](https://iterm2.com/features.html)

2. Run the following command to install **tube-vim**
     ```
     bash <(curl -L https://raw.githubusercontent.com/tolinwei/tube-vim/master/install.sh)
     ```
3. Change the color scheme in **Preferences...    ⌘,** of **Terminal** or **iTerm2** depends on which one you're using.
    + For Terminal
    
        <img src="https://raw.githubusercontent.com/tolinwei/tube-vim/master/preview/terminal.png" alt="terminal preference" width="400" />
    + For iTerm2
    
        <img src="https://raw.githubusercontent.com/tolinwei/tube-vim/master/preview/iterm2.png" alt="terminal preference" width="500" />

### For Linux

**tube-vim** provides a simplified version for server side Linux. Makie sure you have rencent `git` and `wget` installed, then run the following command:
```
bash <(wget -O - https://raw.githubusercontent.com/tolinwei/tube-vim/master/install-linux.sh)
```
     
## Usage Guide

### Vim

- Type `vimtutor` in your shell emulator like **Terminal** or **iTerm2** to open the most rudimental yet intuitive tutorial of Vim
- [Learn Vim Progressively](http://yannesposito.com/Scratch/en/blog/Learn-Vim-Progressively/)
- [Learn Vimscript the hard way](http://learnvimscriptthehardway.stevelosh.com/)

### Vim plugins and feature shortcuts

#####[scrooloose/nerdtree](https://github.com/scrooloose/nerdtree)
- `<Control> + n` - Toggle NERDTree
- `<Control> + w` then `w` - Switch between panes of Vim
- `<Control> + w` then `<left>` - Switch to the left pane of Vim
- `<Control> + w` then `<right>` - Switch to the right pane of Vim

when your cursor is in NERDTree's pane
- `o` or `<Enter>` - Open that file or expend that directory the cursor points to
- `R` (`<Shift> + r`) - Refresh the tree, useful if files change outside of Vim
- `U` (`<Shift> + u`) - Show upper level directory

#####[nathanaelkane/vim-indent-guides](https://github.com/nathanaelkane/vim-indent-guides)
- `z then a` - Fold or un-fold the code trunk, by the deepest level of indent guide

#####[accelerated-smooth-scroll](https://github.com/yonchu/accelerated-smooth-scroll)
- `<Control> + f` - Scroll full page down smoothly
- `<Control> + d` - Scroll half page down smoothly
- `<Control> + b` - Scroll full page up smoothly
- `<Control> + u` - Scroll half page up smoothly

#####[scrooloose/nerdcommenter](https://github.com/scrooloose/nerdcommenter)
`<Leader>` means `,` in current setting, you can modify this by changing the 138 line of your `.vimrc` configuration file.

- `<Leader> + c + c` - Comment the line(s) you selected
- `<Leader> + c + u` - Un-comment the line(s) you selected
- `<Leader> + c + c` - Toggle the comment status of selected line(s)
- `<Leader> + c + y` - Same as <Leader>+c+c expect that the commented line(s) are yanked first

#####[junegunn/vim-easy-align](https://github.com/junegunn/vim-easy-align)

Firstly select the lines you want to align in Visual Mode, then:
- `ga<number><character>` for alignment

For exmple:
- `ga=` wil align to the left by `=`
- `ga:` will align to the left by `:`
- `ga4␣` will align to the left by the forth space.

#####[bling/vim-airline](https://github.com/bling/vim-airline)
#####[majutsushi/tagbar](https://github.com/majutsushi/tagbar)
#####[kien/rainbow_parentheses.vim](https://github.com/kien/rainbow_parentheses.vim)


###tmux

- [A tmux Crash Course](https://robots.thoughtbot.com/a-tmux-crash-course)
- [A tmux Primer](https://danielmiessler.com/study/tmux/)
- [tmux: Productive Mouse-Free Development](http://uploads.mitechie.com/books/tmux_p1_1.pdf)
- [《tmux: Productive Mouse-Free Development》中文翻译]( https://github.com/aqua7regia/tmux-Productive-Mouse-Free-Development_zh)


## Why it is named tube-vim
I started this project when I was working on a Yahoo! Japan fund project, which is internally named **Tube**. Since I used most of the settings from within thie repo for the project, later I decided to rename it as **tube-vim**.

## License

Copyright © [Wei Lin](http://www.linkedin.com/in/tolinwei). Distributed under the same terms as Vim itself. See `:help license`.

[![Analytics](https://ga-beacon.appspot.com/UA-61856209-1/tolinwei/tube-vim)](https://github.com/igrigorik/ga-beacon)

