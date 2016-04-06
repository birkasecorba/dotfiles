#!/usr/bin/env bash

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Install/Update Homebrew
if which brew > /dev/null; then
  brew update
  brew upgrade --all
else
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Installs Xcode Command Line Tools
xcode-select --install
read -rsp $'Press any key to continue when Xcode CLT is done...\n' -n1 key

# Install GNU core utilities (those that come with OS X are outdated).
brew install coreutils

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils

# Install programs
brew cask install google-chrome
brew cask install atom
brew cask install spotify
brew cask install iterm2
brew cask install divvy
brew cask install flux

# Install the Solarized Dark theme for iTerm (you have to select the theme manually)
# open ${HOME}/.themes/*.itermcolors

# Install more recent versions of some OS X tools.
brew install vim --override-system-vi

# Install dev environment tools
brew install git
brew install node

# Install other useful binaries
brew install dockutil

# Remove outdated versions from the cellar.
brew cleanup
