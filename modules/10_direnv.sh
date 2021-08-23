#!/bin/bash

. ../lib.sh
DOTFILES_MOD=direnv

lib_logmod "" "Installing direnv"
lib_pkg_install_if_missing "direnv" "direnv" "direnv"
