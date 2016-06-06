#!/usr/bin/env bash

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Get computer configuration
echo "Select computer configuration
(1) - Personal
(2) - Work"
read -n1 conf
echo "Checking for homebrew"

# Install/Update Homebrew
if which brew > /dev/null; then
  brew update
  brew upgrade --all
else
  echo "Downloading homebrew"
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# If OS is Mac OS
if [ "$(uname)" == "Darwin" ]; then
  # Installs Xcode Command Line Tools
  xcode-select --install
  read -rsp $'Press any key to continue when Xcode CLT is done...\n' -n1 key
fi;

# Install GNU core utilities (those that come with OS X are outdated).
brew install coreutils

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils

# Install programs
brew cask install google-chrome
brew cask install atom
brew cask install spotify
brew cask install iterm2
brew cask install flux

# Install more recent versions of some OS X tools.
brew install vim --override-system-vi

# Install dev environment tools
brew install git
brew install node

# Install other useful binaries
brew install dockutil

case $conf in
1) # Personal Computer
  brew cask install vlc
  ;;
2) # Work Computer
  brew cask install zeplin
  brew cask install tunnelblick
  ;;
esac;

# Remove outdated versions from the cellar.
brew cleanup

# Node required CLIs
npm install webpack -g
npm install svgo -g
npm install imageoptim-cli -g
