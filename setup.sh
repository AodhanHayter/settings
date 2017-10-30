#!/usr/bin/env zsh

set -euo pipefail

dry_run=false

while getopts ":d" opt; do
  case ${opt} in
    d )
      dry_run=true
      echo "!!! Dry Run !!!"
      echo
      ;;
  esac
done

DOT_FILES_PATH="$HOME/settings/dotfiles/runcom"
BREWFILE_PATH="$HOME/settings/dotfiles/homebrew/Brewfile"

# ========================================================================
# DOTFILES
# ========================================================================

echo "### Symlinking dotfiles ###"
echo
for file in $(find $DOT_FILES_PATH -depth 1 -exec basename {} \;); do
  local from="${DOT_FILES_PATH}/${file}"
  local to="${HOME}/.${file}"
  if $dry_run; then
    echo "Will link ${from} -> ${to}"
  else
    ln -sv $from $to
  fi
done
echo

# ========================================================================
# HOMEBREW
# ========================================================================

read "install_homebrew?Do you need to install Homebrew? (y/n) "

if [[ "$install_homebrew" =~ ^[Yy]$ ]]; then
  if $dry_run; then
    echo "Dry Run!!!, Not Installing Hombrew"
  else
    echo "### Installing Homebrew ###"
    # /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi
else
  echo "Skipping Homebrew install"
fi

read "install_brew_packages?Would you like to install Homebrew packages? (y/n) "

if [[ "$install_brew_packages" =~ ^[Yy]$ ]]; then
  echo "Installing Homebrew packages found here: ${BREWFILE_PATH}"
  if $dry_run; then
    echo "Dry Run!!!, Not Installing Hombrew packages"
  else
    echo "### Installing Homebrew packages ###"
    brew bundle $(BREWFILE_PATH)
  fi
else
  echo "Skipping Homebrew packages installation"
fi

