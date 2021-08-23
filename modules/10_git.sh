#!/bin/bash

. ../lib.sh
DOTFILES_MOD=git

lib_logmod "" "Installing Git and GPG"
lib_pkg_install_if_missing "git" "git" "git"
lib_pkg_install_if_missing "gpg" "gnupg2" "gnupg"

if lib_is_macos; then
  lib_cmd ln -sf $PWD/git/macos_gitconfig ~/.gitconfig
else
  lib_cmd ln -sf $PWD/git/gitconfig ~/.gitconfig
fi
