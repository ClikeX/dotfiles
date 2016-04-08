#!/bin/sh

if test ! $(which grc)
then
  echo "  Installing grc (generic colorizer) for you."
  sudo apt-get install grc
fi
