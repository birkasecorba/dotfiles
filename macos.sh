#!/usr/bin/env bash

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until this file has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &


###############################################################################
# Reconfigures a lot of macos default settings to generally make the OS better. #
###############################################################################
sh macos/activity-monitor.sh
sh macos/app-store.sh
sh macos/chrome.sh
sh macos/finder.sh
sh macos/general.sh
sh macos/io.sh
sh macos/iterm.sh
sh macos/layout.sh
sh macos/mail.sh
sh macos/photos.sh
sh macos/spotlight.sh
sh macos/ssd.sh
sh macos/time-machine.sh


###############################################################################
# Kill affected applications                                                  #
###############################################################################
#
for app in "Activity Monitor" \
           "cfprefsd" \
           "Dock" \
           "Finder" \
           "Google Chrome" \
           "Mail" \
           "SystemUIServer" \
           "System Preferences" \
           "Photos" \
           "iTerm"; do
  killall "${app}" &> /dev/null
done
unset app
echo "Done. Note that some of these changes require a logout/restart to take effect."
