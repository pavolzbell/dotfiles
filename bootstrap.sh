#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

rsync --exclude ".DS_Store" --exclude ".git/" \
      --exclude "bootstrap.sh" --exclude "brew.sh" \
      --exclude "LICENSE.md" --exclude "README.md" \
      -avh --no-perms . ~;
