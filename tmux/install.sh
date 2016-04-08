#!/bin/sh

if test ! $(which tmux)
then
  echo "  Installing tmux for you."
  sudo apt-get install tmux
fi
