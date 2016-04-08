# GRC colorizes nifty unix tools all over the place
if $(grc &>/dev/null)
then
GRC=`which grc`
  if [ "$TERM" != dumb ] && [ -n GRC ]
  then
    alias colourify="$GRC -es --colour=auto"
    alias configure='colourify ./configure'
    alias ping='colourify ping'
    alias traceroute='colourify /usr/sbin/traceroute'
    alias gcc='colourify gcc'
    alias g++='colourify g++'
    alias make='colourify make'
    alias netstat='colourify netstat'
    alias diff='colourify diff'
    alias wdiff='colourify wdiff'
    alias mount='colourify mount'
    alias ps='colourify ps'
    alias dig='colourify dig'
    alias ifconfig='colourify ifconfig'
    alias ld='colourify ld'
    alias du='colourify du'
    alias df='colourify df'
  fi
fi
