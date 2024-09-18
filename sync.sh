#!/bin/env bash

# rebuild nixos
echo "Rebuilding NixOS configuration..."
sudo nixos-rebuild switch --flake /home/rotted/.dotfiles#fm

if [ $? -ne 0 ]; then
  echo "NixOS rebuild failed!"
  read -p "Do you want to show-trace? (y/n): " answer
  answer=${answer..}
  if [["$answer" == "y"]]; then
    sudo nixos-rebuild switch --show-trace --flake /home/rotted/.dotfiles#fm 
  elif [["$answer" == "n"]]; then
    exit 1
  else
    echo "Invaild input. Please enter 'y' or 'n'."
    exit 1
  fi
  exit 1
fi

# rebuild home-manger
echo "Rebuilding Home-Manager configuration..."
home-manager switch --flake /home/rotted/.dotfiles#rotted@fm

if [ $? -ne 0 ]; then 
  echo "Home-Manager rebuild failed!"
  read -p "Do you want to show-trace? (y/n): " answer
  answer=${answer..}
  if [["$answer" == "y"]]; then
    home-manager switch --show-trace --flake /home/rotted/.dotfiles#rotted@fm 
  elif [["$answer" == "n"]]; then
    exit 1
  else
    echo "Invaild input. Please enter 'y' or 'n'."
    exit 1
  fi
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
COMMIT_MSG="$(date)"
git commit -m "$COMMIT_MSG"

# push changes to git
git push -u origin main

if [ $? -eq 0 ]; then
  echo "Changes successfully pushed to Git."
else
  echo "Failed to push changes to Git."
fi


