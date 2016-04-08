#!/bin/sh

if test ! $(which golang)
then
  echo "  Installing golang for you."
  sudo apt-get install -y golang
fi
