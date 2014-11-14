# for GNU commands
alias ll='ls -l'
alias la='ls -la'
    # promote before every excution (removal, copy, moving)
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

export CLICOLOR=1
export TERM=xterm-256color
# export LSCOLORS=GxFxCxDxBxegedabagaced
export LSCOLORS=Exfxcxdxbxegedabagacad

# for virtualenv
export WORKON_HOME=~/Projects/Envs
# source /usr/local/bin/virtualenvwrapper.sh

# for Elasticsearch
export ES_HOME=/usr/local/Cellar/elasticsearch/1.4.0
export ES_PLUGIN=/usr/local/var/lib/elasticsearch/plugins

# for mysql excutable file
export PATH=$PATH:/usr/local/mysql/bin

# for login to staging.
alias gostaging='ssh -A -i Staging.pem root@54.86.244.184'
