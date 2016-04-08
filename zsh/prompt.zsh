autoload colors && colors
# cheers, @ehrenmurdick
# http://github.com/ehrenmurdick/config/blob/master/zsh/prompt.zsh

if (( $+commands[git] )) ; then
  git="$commands[git]"
else
  git="/usr/bin/git"
fi

git_branch() {
  echo $($git symbolic-ref HEAD 2>/dev/null | awk -F/ {'print $NF'})
}

git_dirty() {
  st=$($git status 2>&1)
  if [[ $st =~ "Not a git repository" ]] ; then
    echo ""
  else
    if [[ "$st" =~ "nothing to commit" ]] ; then
      echo " %{$fg_bold[green]%}$(git_prompt_info)%{$reset_color%}"
    else
      echo " %{$fg_bold[red]%}$(git_prompt_info)%{$reset_color%}"
    fi
  fi
}

git_prompt_info() {
  ref=$($git symbolic-ref HEAD 2>/dev/null) || return
  # echo "(%{\e[0;33m%}${ref#refs/heads/}%{\e[0m%})"
  echo "${ref#refs/heads/}"
}

unpushed() {
  $git cherry -v @{upstream} 2>/dev/null
}

need_push() {
  if [[ $(unpushed) == "" ]] ; then
    echo " "
  else
    echo "%{$fg_bold[magenta]%}*%{$reset_color%} "
  fi
}

ruby_version() {
  if (( $+commands[rbenv] )) ; then
    result="$((rbenv version | awk '{print $1}') 2>&1)"
    if [[ $result =~ "not installed" ]] ; then
      echo "rbenv-error"
    else
      echo $result
    fi
  fi

  if (( $+commands[rvm-prompt] )) ; then
    echo "$(rvm-prompt | awk '{print $1}')"
  fi
}

rb_prompt() {
  if ! [[ -z "$(ruby_version)" ]] ; then
    echo "%{$fg_bold[yellow]%}$(ruby_version)%{$reset_color%} "
  else
    echo ""
  fi
}




function update_cabal_sandbox_info () {
  if [[ -f cabal.sandbox.config ]] ; then
    export __CABAL_SANDBOX="sbx "
  else
    export __CABAL_SANDBOX=
  fi
  export __CABAL_SANDBOX_VARS_INVALID=
}

function get_cabal_sandbox_info () {
  test -n "$__CABAL_SANDBOX_VARS_INVALID" && update_cabal_sandbox_info
  echo $__CABAL_SANDBOX
}

typeset -ga preexec_functions
typeset -ga precmd_functions
typeset -ga chpwd_functions
setopt prompt_subst

export __CABAL_SANDBOX=
export __CABAL_SANDBOX_VARS_INVALID=1

chpwd_functions+='update_cabal_sandbox_chpwd'
update_cabal_sandbox_chpwd () {
  export __CABAL_SANDBOX_VARS_INVALID=1
}

preexec_functions+='update_cabal_sandbox_preexec'
update_cabal_sandbox_preexec () {
case "$(history $HISTCMD)" in
  *cabal*) export __CABAL_SANDBOX_VARS_INVALID=1 ;;
esac
}

SLR_DARKSEA=%{$fg_bold[green]%}
sandbox_prompt () {
  test -n $__CABAL_SANDBOX && echo "%{$fg[yellow]%}$(get_cabal_sandbox_info)${reset_color}"
}



indent_with_comment() {
  echo " %{$fg[black]%}#%{$reset_color%}"
}

indent_with_continuation() {
  echo "%{$fg[white]%}...%{$fg[black]%}#%{$reset_color%}"
}

return_code() {
  echo "%{$fg[red]%}! %?%{$reset_color%}"
}

hostname_color() {
  if env|grep -q SSH_CLIENT
  then
    echo "%{$fg[red]%}%M%{$reset_color%}"
  else
    echo "%{$fg[green]%}%M%{$reset_color%}"
  fi
}

user_host_and_path() {
  echo "%(!.%{$fg[red]%}.%{$fg[green]%})%n%{$reset_color%}%{$fg[white]%}@$(hostname_color)%{$fg[white]%}:%{$reset_color%}%{$fg[green]%}%~"
}

date_and_time() {
  echo "%{$fg[blue]%}%D{%F %H:%M:%S}%{$reset_color%}"
}

arrow() {
  echo "%(!.%{$fg[red]%}.%{$fg[green]%})%# %{$reset_color%}"
}

PROMPT=$'%(?..${return_code}
)
$(date_and_time) $(user_host_and_path)$(git_dirty)$(need_push)$(rb_prompt)$(sandbox_prompt)
$(arrow)'
PROMPT2=$'$(indent_with_continuation)$(arrow)'

#$'\n$(rb_prompt)in $(directory_name) $(git_dirty)$(need_push)\n%% '
set_prompt () {
  export RPROMPT="%{$fg_bold[cyan]%}%{$reset_color%}"
}

precmd() {
  title "zsh" "%m" "%55<...<%~"
  set_prompt
}
