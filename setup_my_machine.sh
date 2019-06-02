#!/bin/bash

# BASH
ln -sf bash/bashrc ~/.bashrc

# EMACS
sudo dnf install emacs-nox
ln -sf emacs/emacs ~/.emacs
ln -sf emacs/emacs.d ~/.emacs.d

# FISH
sudo dnf install fish
sudo dnf install util-linux-user # For `chsh` command
mkdir ~/.config/
mkdir ~/.config/fish/
ln -sf fish/config.fish ~/.config/fish/config.fish
ln -sf fish/functions/ ~/.config/fish/functions
ln -sf fish/completions/ ~/.config/fish/completions
chsh -s /bin/fish $USER

# GIT
sudo dnf install git
ln -sf git/gitconfig ~/.gitconfig
