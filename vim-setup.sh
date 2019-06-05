#!/usr/bin/env zsh

set -euo pipefail

VIM_HOME="$HOME/.vim"
AUTOLOAD_HOME="$VIM_HOME/autoload"
VIMRC_PATH="$HOME/settings/dotfiles/vim/vimrc"
VIM_PLUG_PATH="$HOME/settings/dotfiles/vim/autoload/plug.vim"

if [ ! -d "$VIM_HOME" ]; then
  mkdir -v $VIM_HOME
  mkdir -v $AUTOLOAD_HOME
else
  echo ".vim directory already setup"
fi

ln -sv $VIMRC_PATH "$VIM_HOME/vimrc"
ln -sv $VIM_PLUG_PATH "$AUTOLOAD_HOME/plug.vim"
