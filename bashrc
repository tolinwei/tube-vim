# for GNU commands
alias ll="ls -l"
alias la="ls -la"

# promotion before every dangerous excution (removal, copy, moving)
alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"

# export CLICOLOR=1
# export LSCOLORS=Exfxcxdxbxegedabagacad
# to make vim colorscheme works under tmux
export TERM=xterm-256color

# for virtualenv
export WORKON_HOME=~/Projects/Envs
# source /usr/local/bin/virtualenvwrapper.sh

# for Elasticsearch
export ES_HOME=/usr/local/Cellar/elasticsearch/1.3.4
export ES_PLUGIN=/usr/local/var/lib/elasticsearch/plugins

# for MySQL
alias mysql="/usr/local/mysql-5.6.20-osx10.8-x86_64/bin/mysql"

# for Git
git config --global user.name "Wei Lin"
git config --global user.email "linwei@yahoo-inc.com"
git config colo.ui true

# for Benzene
export JAVA_HOME=/home/y
alias ut="ssh uranium-gw.tan.ygrid.yahoo.com"
alias zt="ssh zanium-gw.tan.ygrid.yahoo.com"
alias cb="ssh cobalt-gw.blue.ygrid.yahoo.com"
alias ut-launcher="ssh dp-fetlbenzene-launch-dev1.data.ne1.yahoo.com"
alias cb-launcher="ssh dp-fetlbenzene-launch-dev1.data.gq1.yahoo.com"
