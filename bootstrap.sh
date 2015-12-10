#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")"

git pull origin master

rsync -avh --no-perms --exclude ".git" --exclude-from ".gitignore" --exclude "bootstrap.sh" --exclude "*.md" . ~
