#!/bin/env bash

# rebuild nixos
echo "Rebuilding NixOS configuration..."
sudo nixos-rebuild switch --flake /home/rotted/.dotfiles#fm

if [ $? -ne 0 ]; then
  echo "NixOS rebuild failed!"
  exit 1
fi

# rebuild home-manger
echo "Rebuilding Home-Manager configuration..."
home-manager switch --flake /home/rotted/.dotfiles#rotted@fm

if [ $? -ne 0 ]; then 
  echo "Home-Manager rebuild failed!"
  exit 1
fi

# cd into .dotfiles
cd /home/rotted/.dotfiles

# add changes to git
echo "Adding changes to Git..."
git add .

# show git diff
echo "Showing git dif..."
git diff --cached

# commit
COMMIT_MSG="Rebuild NixOS configuration on $(date)"
git commit -m "$COMMIT_MSG"

# push changes to git
git push -u origin main

if [ $? -eq 0 ]; then
  echo "Changes successfully pushed to Git."
else
  echo "Failed to push changes to Git."
fi


