#!/bin/sh

if test ! $(which ack-grep)
then
  echo "  Installing ack for you."
  sudo apt-get install -y ack-grep
fi
