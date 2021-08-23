#!/bin/bash

. ../lib.sh
DOTFILES_MOD=vim

lib_logmod "" "Installing vim"
lib_pkg_install_if_missing "vim" "neovim" "neovim"
