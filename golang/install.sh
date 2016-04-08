#!/bin/sh

if test ! $(which go)
then
  echo "  Installing golang for you."
  sudo apt-get install -y golang
fi
