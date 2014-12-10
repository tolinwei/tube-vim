# for GNU commands
alias ll="ls -l"
alias la="ls -la"

# promotion before every dangerous excution (removal, copy, moving)
alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"

export CLICOLOR=1
# export LSCOLORS=GxFxCxDxBxegedabagaced
export LSCOLORS=Exfxcxdxbxegedabagacad

# for virtualenv
export WORKON_HOME=~/Projects/Envs
source /usr/local/bin/virtualenvwrapper.sh

# for Elasticsearch
export ES_HOME=/usr/local/Cellar/elasticsearch/1.3.4
export ES_PLUGIN=/usr/local/var/lib/elasticsearch/plugins

# for MySQL
alias mysql="/usr/local/mysql-5.6.20-osx10.8-x86_64/bin/mysql"
# for login to staging of Crowdskout
alias gostaging="ssh -A -i ~/Projects/Staging.pem root@54.86.244.184"
