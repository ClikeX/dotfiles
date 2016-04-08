# ^Q and ^S should not do what they normally do (control scrolling)
# this allows some (less sophisticated) software to actually use these keys
stty start undef # frees ctrl-q
stty stop undef # frees ctrl-s

# set some ctrl key binds
bindkey "^E" end-of-line
bindkey "^B" beginning-of-line
bindkey "^R" history-incremental-search-backward

# make shift-tab work like expected
bindkey '^[[Z' reverse-menu-complete

# get tmux to play nice with 256 colors
export TERM=xterm-256color
alias tmux TERM=xterm-256color tmux
