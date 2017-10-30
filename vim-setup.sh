#!/usr/bin/env zsh

set -euo pipefail

VIM_HOME="$HOME/.vim"
VIMRC_PATH="$HOME/settings/dotfiles/vim/vimrc"

if [ ! -d "$VIM_HOME" ]; then
  mkdir -v $VIM_HOME
else
  echo ".vim directory already setup"
fi

ln -sv $VIMRC_PATH "$VIM_HOME/vimrc"
