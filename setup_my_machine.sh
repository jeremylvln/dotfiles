#!/bin/bash

if [ ! -d ~/.config ]; then
    mkdir ~/.config/
fi

# Common
sudo apt-get update
sudo apt-get upgrade

# Docker
sudo apt-get install -y apt-transport-https ca-certificates curl gnupg lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
    "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io

# Emacs
sudo apt-get install -y emacs-nox
ln -sf $PWD/emacs/emacs ~/.emacs
ln -sf $PWD/emacs/emacs.d ~/.emacs.d

# Fish
sudo apt-get install -y fish
sudo apt-get install -y util-linux-user # For `chsh` command

if [ ! -d ~/.config/fish ]; then
    mkdir ~/.config/fish/
fi

ln -sf $PWD/fish/config.fish ~/.config/fish/config.fish
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
curl -fsSL https://starship.rs/install.sh | bash
sudo chsh -s /bin/fish $USER

# Git
sudo apt-get install -y git
ln -sf $PWD/git/gitconfig ~/.gitconfig
