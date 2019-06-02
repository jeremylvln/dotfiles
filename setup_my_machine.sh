#!/bin/bash

if [ ! -d ~/.config ]; then
    mkdir ~/.config/
fi

# BASH
ln -sf bash/bashrc ~/.bashrc

# EMACS
sudo dnf install emacs-nox
ln -sf $PWD/emacs/emacs ~/.emacs
ln -sf $PWD/emacs/emacs.d ~/.emacs.d

# FISH
sudo dnf install fish
sudo dnf install util-linux-user # For `chsh` command

if [ ! -d ~/.config/fish ]; then
    mkdir ~/.config/fish/
fi

ln -sf $PWD/fish/config.fish ~/.config/fish/config.fish
ln -sf $PWD/fish/config.color.fish ~/.config/fish/config.color.fish
ln -sf $PWD/fish/functions/ ~/.config/fish/functions
ln -sf $PWD/fish/completions/ ~/.config/fish/completions
ln -sf $PWD/fish/fish_variables ~/.config/fish/fish_variables
sudo chsh -s /bin/fish $USER

# GIT
sudo dnf install git
ln -sf $PWD/git/gitconfig ~/.gitconfig
