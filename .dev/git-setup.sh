#!/bin/bash

name=$1
email=$2

if [ -z "$name" ] || [ -z "$email" ]; then
  echo "Usage: git-setup.sh <name> <email>"
  exit 1
fi

echo "Installing dependecies (neovim, git, gcc)..."
apk add git openssh-keygen openssh-client

git config --global user.name $name
git config --global user.email $email
git config --global --add safe.directory '*' # Fixing the dubious ownership issue
git config --global pull.ff true

echo "Generating SSH Keys..."
ssh-keygen -t rsa -b 4096 -C $email

echo "The next line is you SSH Key. Save it on GitHub to login"
cat ~/.ssh/id_rsa.pub

exit 0
