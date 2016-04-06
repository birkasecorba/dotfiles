#!/usr/bin/env bash
git pull origin master;

rsync --exclude=".DS_Store" --include=".**" --exclude="*" -avh --no-perms . ~;
source ~/.bash_profile;
