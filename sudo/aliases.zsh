alias _='sudo'
alias please='sudo'
alias bitch='sudo'
alias fuck='sudo $(fc -ln -1)'

# Privileged access
if [ $UID -ne 0 ]; then
    alias sudo='sudo '
    alias scat='sudo cat'
    alias se='sudoedit'
    alias reboot='sudo systemctl reboot'
    alias poweroff='sudo systemctl poweroff'
    alias apt-get='sudo apt-get'
fi
