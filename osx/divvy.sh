###############################################################################
# Divvy				                                                                #
###############################################################################

# Map 'ctrl + space' to open Divvy
defaults write com.mizage.Divvy useGlobalHotkey -bool YES
defaults write com.mizage.direct.Divvy globalHotkey "{ keyCode = 49; modifiers = 4096; }"

# Increase colum and row # on grid
defaults write com.mizage.Divvy useDefaultGrid -bool YES
defaults write com.mizage.Divvy defaultRowCount -int 10
defaults write com.mizage.Divvy defaultColumnCount -int 10
defaults write com.mizage.Divvy lastColumnCount -int 10
defaults write com.mizage.Divvy lastRowCount -int 10

# Remove menu icon from toolbar
defaults write com.mizage.Divvy showMenuIcon -bool NO

# Disable margins between grid elements
defaults write com.mizage.Divvy enableMargins -bool NO

# Dismiss panel when an app is resized
defaults write com.mizage.Divvy mustDismissPanel -bool NO
