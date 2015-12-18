tube-shell
============
```
 _         _                    _          _ _
| |_ _   _| |__   ___       ___| |__   ___| | |
| __| | | | '_ \ / _ \_____/ __| '_ \ / _ \ | |
| |_| |_| | |_) |  __/_____\__ \ | | |  __/ | |
 \__|\__,_|_.__/ \___|     |___/_| |_|\___|_|_|

```

**tube-shell** is a integrated shell environment that mainly designed for OS X. You can install it by **running a single command**:
```
bash <(curl -L https://raw.githubusercontent.com/tolinwei/tube-shell/master/install.sh)
```
**tube-shell** includes best practical Vim settings, bunch of Vim plugins managed by **[junegunn/vim-plug](https://github.com/junegunn/vim-plug)**, and decent color scheme **[gruvbox](https://github.com/morhetz/gruvbox)** ([gruvbox-terminal](https://github.com/flipxfx/gruvbox-terminal) & [gruvbox-generalized](https://github.com/morhetz/gruvbox-generalized) for Terminal & iTerm2).

**tube-shell** also installs Z shell `zsh`'s wrapper **oh-my-zsh** ([Github](https://github.com/robbyrussell/oh-my-zsh) | [Official size](http://ohmyz.sh/)) as the replacement of most system's default `bash`. You can switch to it easily due to its full compatibility with `bash`.

As a supplement, **[tmux](http://tmux.github.io/)**, which is a terminal multiplexer, will be installed to accerate your operation (OS X only). If you feel `screen` better than `tmux`, a configuration for the former one is also provided to help you manage the sessions.

<a href="https://github.com/tolinwei/tube-shell/wiki/%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87%E6%96%87%E6%A1%A3" target="_blank">
简体中文文档正在编辑中</a>

## Preview
<img src="https://raw.githubusercontent.com/tolinwei/dev-config/master/preview/java-preview.png" width="900">
<img src="https://raw.githubusercontent.com/tolinwei/dev-config/master/preview/perl-preview.png" width="900">


## Installation

### For OS X
1. (Optional) Install **[iTerm2](https://iterm2.com/index.html)** ([direct link](https://iterm2.com/downloads/stable/iTerm2_v2_0.zip)) as Terminal replacement, check out more features [here](https://iterm2.com/features.html)

2. Run the following command to install **tube-shell**
     ```
     bash <(curl -L https://raw.githubusercontent.com/tolinwei/tube-shell/master/install.sh)
     ```
3. Change the color scheme in **Preferences...&nbsp;&nbsp;&nbsp;&nbsp;⌘,** of **iTerm2** or **Terminal** depends on which one you're using.
     + <a href="https://github.com/tolinwei/tube-shell/wiki/How-to-change-color-scheme-of-iTerm2-&-Terminal.app" target="_blank">
How to change color scheme of iTerm2 & Terminal.app</a>

4. (Optional) Modified the following lines in your `~/.bashrc` to correct git commits info if you're using `git` and have no existing `~/.bashrc` before installation
     ```
     git config --global user.name "<put-your-name-here>"
     git config --global user.email "<put-your-email-here>"
     ```

### For Linux

**tube-shell** provides a simplified<sup>*</sup> version for server side Linux, as it's always anoying to develop on a bare remote machine. Makie sure you have rencent `git` and `wget` installed, then run the following command to set up quickly:
```
bash <(wget -O - https://raw.githubusercontent.com/tolinwei/tube-shell/master/install-linux.sh)
```

## Usage Guide

### Vim

- Type `vimtutor` in your shell emulator like **Terminal** or **iTerm2** to open the most rudimental yet intuitive tutorial of Vim
- [Learn Vim Progressively](http://yannesposito.com/Scratch/en/blog/Learn-Vim-Progressively/)
- [Learn Vimscript the hard way](http://learnvimscriptthehardway.stevelosh.com/)
- [Practical Vim - Edit Text at the Speed of Though](http://media.pragprog.com/titles/dnvim/toc.pdf)

### Vim plugins and feature shortcuts

#####[scrooloose/nerdtree](https://github.com/scrooloose/nerdtree)
- `<Control>` + `n` - Toggle NERDTree
- `<Control>` + `w` then `w` - Switch between panes of Vim
- `<Control>` + `w` then `<left>` - Switch to the left pane of Vim
- `<Control>` + `w` then `<right>` - Switch to the right pane of Vim

when your cursor is in NERDTree's pane
- `o` or `<Enter>` - Open that file or expend that directory the cursor points to
- `R` (`<Shift> + r`) - Refresh the tree, useful if files change outside of Vim
- `U` (`<Shift> + u`) - Show upper level directory

when you're in any pane, you can use
- `:vertical res <size_number>` to adjust the width of the pane where your cursor is inside
- `:vertical res +<size_number>` or `:vertical res -<size_number>` to increase or decrese the width

#####[nathanaelkane/vim-indent-guides](https://github.com/nathanaelkane/vim-indent-guides)
- `z` then `a` - Fold or un-fold the code trunk, by the deepest level of indent guide

#####[accelerated-smooth-scroll](https://github.com/yonchu/accelerated-smooth-scroll)
- `<Control>` + `f` - Scroll full page down smoothly
- `<Control>` + `d` - Scroll half page down smoothly
- `<Control>` + `b` - Scroll full page up smoothly
- `<Control>` + `u` - Scroll half page up smoothly

#####[scrooloose/nerdcommenter](https://github.com/scrooloose/nerdcommenter)
`<Leader>` means `,` in current setting, you can modify this in your `.vimrc`

- `<Leader>` + `c` + `c` - Comment the line(s) you selected
- `<Leader>` + `c` + `u` - Un-comment the line(s) you selected
- `<Leader>` + `c` + `i` - Toggle the comment status of selected line(s)
- `<Leader>` + `c` + `y` - Same as <Leader>+c+c expect that the commented line(s) are yanked first

#####[junegunn/vim-easy-align](https://github.com/junegunn/vim-easy-align)

Firstly select the lines you want to align in Visual Mode, then:
- `g` then `a` then `<number>`(optional) then `<character>` for alignment

For exmple:
- `ga=` wil align to the left by `=`
- `ga:` will align to the left by `:`
- `ga4␣` will align to the left by the forth space.

#####[majutsushi/tagbar](https://github.com/majutsushi/tagbar)
- `<Control>` + `t` - Toggle Tagbar

#####[bling/vim-airline](https://github.com/bling/vim-airline)
#####[kien/rainbow_parentheses.vim](https://github.com/kien/rainbow_parentheses.vim)

###tmux

- [A tmux Crash Course](https://robots.thoughtbot.com/a-tmux-crash-course)
- [A tmux Primer](https://danielmiessler.com/study/tmux/)
- [tmux: Productive Mouse-Free Development](http://uploads.mitechie.com/books/tmux_p1_1.pdf)

## Why it is named tube-shell
I started this project when I was working on a Yahoo! Japan fund project, which is internally named **Tube**. Since I used most of the settings from within thie repo for the project, later I decided to rename it as **tube-shell**.

## License

Copyright © [Wei Lin](http://www.linkedin.com/in/tolinwei). Distributed under the same terms as Vim itself. See `:help license`.

