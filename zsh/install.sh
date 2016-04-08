#!/bin/sh

if test ! $(which zsh)
then
  echo "  Installing zsh for you."
  sudo apt-get install -y zsh
fi
