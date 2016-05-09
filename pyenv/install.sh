#!/bin/sh

if test ! $(which pyenv)
then
  echo "  Installing pyenv for you."
  git clone https://github.com/yyuu/pyenv.git ~/.pyenv
fi
