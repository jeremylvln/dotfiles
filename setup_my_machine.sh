#!/bin/bash

PERSONAL_USERNAME = "jeremy"
PERSONAL_HOME = "/home/$PERSONAL_USERNAME"
PERSONAL_DOTFILES_REPO = "git@github.com:IamBlueSlime/dotfiles"
PERSONAL_DOTFILES = "$PERSONAL_HOME/dotfiles"

BASIC_PACKAGES = (
	git
	emacs-nox
	python3
	nodejs
)

SERVER_PACKAGES = (
	nginx
	certbot
)

set -x

## Step 1 - Create the system user
echo "Step 1 - Create the system user?"
useradd $PERSONAL_USERNAME -G wheel
passwd $PERSONAL_USERNAME

## Step 2 - Installing basic packages
echo "Step 2 - Installing basic packages"
dnf install $BASIC_PACKAGES

## Step 3 - Setuping dotfiles
echo "Step 3 - Setuping dotfiles"
sudo -u $PERSONAL_USERNAME -H git clone $PERSONAL_DOTFILES_REPO $PERSONAL_DOTFILES
sudo -u $PERSONAL_USERNAME -H ln -s $PERSONAL_DOTFILES/.bashrc $PERSONAL_HOME/.bashrc
sudo -u $PERSONAL_USERNAME -H ln -s $PERSONAL_DOTFILES/.emacs $PERSONAL_HOME/.emacs
sudo -u $PERSONAL_USERNAME -H ln -s $PERSONAL_DOTFILES/.emacs.d $PERSONAL_HOME/.emacs.d

## Step 4 - Installing server packages
echo "Step 4 - Installing server packages"
printf "Type 'Y' or 'N': "
read $CONTINUE
if [ $CONTINUE == "Y" ]; then
	dnf install $SERVER_PACKAGES
fi

echo "Done :D"
