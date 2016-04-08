#!/bin/sh

if test ! $(which git-flow)
then
  echo "  Installing git-flow for you."
  sudo apt-get install -y git-flow
fi
