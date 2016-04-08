if [[ -n $SSH_CONNECTION ]]; then
  export PS1='%m:%3~$(git_info_for_prompt)%# '
else
  export PS1='%3~$(git_info_for_prompt)%# '
fi

export LSCOLORS="exfxcxdxbxegedabagacad"
export CLICOLOR=true

fpath=($ZSH/functions $fpath)

autoload -U $ZSH/functions/*(:t)

# say how long a command took, if it took more than 30 seconds
export REPORTTIME=30

# prompts for confirmation after 'rm *' etc
# helps avoid mistakes like 'rm * o' when 'rm *.o' was intended
setopt RM_STAR_WAIT

# get tmux to play nice with 256 colors
export TERM=xterm-256color
alias tmux TERM=xterm-256color tmux

# quick find
f() {
  echo "find . -iname \"*$1*\""
  find . -iname "*$1*"
}

s() {
  if [ -d $1 ]; then ls -lha $1;
  elif [ -x $1 ]; then $1;
  elif [ -e $1 ]; then cat $1;
  else $1; fi
}

# don't expand aliases _before_ completion has finished
#   like: git comm-[tab]
setopt complete_aliases

# do not make problems when using comments (#) on the prompt
setopt interactivecomments

zle -N newtab

