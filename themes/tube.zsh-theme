# ZSH Theme
local prefix='%(?,,%{$fg[red]%}FAIL: $?%{$reset_color%})'
local user_host='%{$fg[magenta]%}%n%{$reset_color%}@%{$fg[yellow]%}%m%{$reset_color%}'
local current_dir='%{$fg_bold[blue]%}%~%{$reset_color%}'

local rvm_ruby=''
if which rvm-prompt &> /dev/null; then
  rvm_ruby='%{$fg[magenta]%}‹$(rvm-prompt i v g)›%{$reset_color%}'
else
  if which rbenv &> /dev/null; then
    rvm_ruby='%{$fg[magenta]%}‹$(rbenv version | sed -e "s/ (set.*$//")›%{$reset_color%}'
  fi
fi

local git_branch='$(git_prompt_info)'

function prompt_char {
	if [ $UID -eq 0 ]; then echo "%{$fg[red]%}#%{$reset_color%}"; else echo $; fi
}

PROMPT="${prefix}${user_host}: ${current_dir} ${rvm_ruby} ${git_branch}
%_$(prompt_char) "

RPROMPT='%{$fg[green]%}[%*]%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="›%{$reset_color%}"
