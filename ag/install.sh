#!/bin/sh

if test ! $(which ag)
then
  echo "  Installing ag (the silver searcher) for you."
  sudo apt-get install -y silversearcher-ag
fi
