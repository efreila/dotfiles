#!/bin/bash

set -eufo pipefail

# https://github.com/mathiasbynens/dotfiles/blob/main/.macos

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &


# Disables natural scrolling
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false



###############################################################################
# Menu Bar                                                                    #
###############################################################################

# Displays Bluetooth in the menu bar
defaults write ~/Library/Preferences/ByHost/com.apple.controlcenter.plist Bluetooth -int 18

###############################################################################
# Dock                                                                        #
###############################################################################

defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock "autohide-delay" -float "0.0001"
defaults write com.apple.dock show-recents -bool false

###############################################################################
# Screen                                                                      #
###############################################################################

# Require password immediately after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Use scroll gesture with the Ctrl (^) modifier key to zoom
defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true
defaults write com.apple.universalaccess HIDScrollZoomModifierMask -int 262144

###############################################################################
# Kill affected applications                                                  #
###############################################################################

for app in "Dock" \
	"SystemUIServer" \
	"cfprefsd"; do
	killall "${app}" &> /dev/null
done
echo "Done. Note that some of these changes require a logout/restart to take effect."
