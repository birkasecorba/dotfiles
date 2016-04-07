# Start at login
defaults write org.herf.Flux startAtLogin -bool true

# Don't show popup
defaults write org.herf.Flux moveToApplicationsFolderAlertSuppress -bool true

# Set color temperatures
defaults write org.herf.Flux nightColorTemp -int 3600
defaults write org.herf.Flux lateColorTemp -int 2700

# Set wakeup time
defaults write org.herf.Flux wakeTime -int 510

# Set location (San Mateo)
defaults write org.herf.Flux location -string "94403"
defaults write org.herf.Flux locationTextField -string "94403"
defaults write org.herf.Flux locationType -string "Z"
