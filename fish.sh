#!/usr/bin/env bash
brew install fish

read -p "Make fish default shell? (y/N) " -n 1;
echo "";
if [[ $REPLY =~ ^[y]$ ]]; then
  echo `which fish` | sudo tee -a /etc/shells
  chsh -s `which fish`
fi

curl -L https://github.com/oh-my-fish/oh-my-fish/raw/master/bin/install | fish
omf install simple-ass-prompt
omf update
