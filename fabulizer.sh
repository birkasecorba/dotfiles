#!/usr/bin/env bash
git pull origin master;

rsync --exclude=".DS_Store" --exclude=".git" --include=".**" --exclude="*" -avh --no-perms . ~;
source ~/.bash_profile;

exec $SHELL -l;
