#!/bin/bash

set -euo pipefail

DOT_FILES_PATH="$HOME/settings/dotfiles/runcom"
BREWFILE_PATH ="$HOME/settings/dotfiles/homebrew/Brewfile"

# ========================================================================
# DOTFILES
# ========================================================================

echo "### Symlinking dotfiles ###"
echo
for file in $(find $DOT_FILES_PATH -depth 1 -exec basename {} \;); do
  from="$DOT_FILES_PATH"
  to="$HOME/.$file"
  echo "Linking ${from} -> ${to}"
  # ln -s $from $to
done
echo

# ========================================================================
# HOMEBREW
# ========================================================================

read -p "Do you need to install Homebrew? (y/n) " INSTALL_HOMEBREW
if [ "$INSTALL_HOMEBREW" = "y" ]; then
  echo "Install Homebrew"
  # /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo "Installing Homebrew packages"
# brew bundle $(BREWFILE_PATH)

