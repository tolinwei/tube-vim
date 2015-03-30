config-files
============

Configuration files for setting up UNIX-like dev environment.

### Preview


### Usage
Just clone the repo and execute `bash install.sh` to get everything done for you.
If you just need Vim configuration, run `bash vim-install.sh` instead, which is a subset of `install.sh`.

You'll be prompted to enter your password or type `yes` for certificate things during the script's running)

(If you're using `chroot` or any modified version like `yroot`, don't use `sudo bash install.sh` instead because this would lead the `cp` command in `install.sh` entering the wrong directory)

### Lists

* **[iTerm2](http://iterm2.com/)** needs to be downloaded by yourself as terminal replacement
* **[gruvbox](https://github.com/morhetz/gruvbox)** as Vim color schema
* **Darkside** from [Iterm2-color-schemes](http://iterm2colorschemes.com/)
* **[tmux](http://tmux.sourceforge.net/)** as terminal multiplexer (change hot key to C-a)
* **[Vundle](https://github.com/gmarik/Vundle.vim)** as Vim plugins management tool
* ...

