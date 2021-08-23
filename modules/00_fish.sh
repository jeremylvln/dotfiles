#!/bin/bash

. ../lib.sh
DOTFILES_MOD=fish

lib_logmod "" "Installing Fish"
lib_pkg_install_if_missing "fish" "fish" "fish"

lib_logmod "" "Changing default shell"
lib_pkg_install_if_missing "chsh" "util-linux-user" ""
lib_cmd sudo chsh -s "$(which fish)" $USER

lib_logmod "" "Configuring Fish"

if [ ! -d ~/.config/fish ]; then
  mkdir -p ~/.config/fish/
fi

lib_cmd ln -sf $PWD/fish/config.fish ~/.config/fish/config.fish
lib_cmd echo "curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher" | fish
USE_SNAP=true lib_pkg_install_if_missing "starship" "starship" "starship"
lib_cmd ln -sf $PWD/starship/starship.toml ~/.config/starship.toml
