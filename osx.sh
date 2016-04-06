#!/usr/bin/env bash

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until this file has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &


###############################################################################
# Reconfigures a lot of OSX default settings to generally make the OS better. #
###############################################################################
sh osx/activity-monitor.sh
sh osx/app-store.sh
sh osx/chrome.sh
sh osx/divvy.sh
sh osx/finder.sh
sh osx/flux.sh
sh osx/general.sh
sh osx/io.sh
sh osx/iterm.sh
sh osx/layout.sh
sh osx/mail.sh
sh osx/photos.sh
sh osx/spotlight.sh
sh osx/ssd.sh
sh osx/time-machine.sh


###############################################################################
# Kill affected applications                                                  #
###############################################################################
#
for app in "Activity Monitor" \
					 "cfprefsd" \
					 "Divvy" \
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
