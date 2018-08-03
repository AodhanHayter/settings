#!/user/bin/env zsh

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 61; kill -0 "$$" || exit; done 2>/dev/null &

###############################################################################
# General UI/UX                                                               #
###############################################################################

# Set highlight color to green
defaults write NSGlobalDomain AppleHighlighColor -string "0.752941 0.964706 0.678431"

# disable system-wide resume
defaults write com.apple.systempreferences NSQuitAlwaysKeepsWindows -bool false

# Disable animations when opening and closing windows
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false

# Disable animations when opening quick look window
defaults write -g QLPanelAnimationDuration -float 0

## DOCK ##

# Don't automatically rearrange Spaces based open most recent use
defaults write com.apple.dock mru-spaces -bool false

# Automatically hide and show dock
defaults write com.apple.dock autohide -bool true

# Make dock icons of hidden apps translucent
defaults write com.apple.dock showhidden -bool true


## App Store ##

# Enable the automatic update check
defaults write com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true

# Check for software updates daily, not just once per week
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

# Download newly available updates in background
defaults write com.apple.SoftwareUpdate AutomaticDownload -int 1

# Install System data files & security updates
defaults write com.apple.SoftwareUpdate CriticalUpdateInstall -int 1

# Automatically download apps purchased on other Macs
defaults write com.apple.SoftwareUpdate ConfigDataInstall -int 1

# Turn on app auto-update
defaults write com.apple.commerce AutoUpdate -bool true

# Allow the App Store to reboot machine on macOS updates
defaults write com.apple.commerce AutoUpdateRestartRequired -bool true

## Photos ##
#
# Prevent Photos from opening automatically when devices are plugged in
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true

for app in "Activity Monitor" \
  "Dock" \
  "Photos" \
  "SystemUIServer" \
  "iCal"; do
  killall "${app}" &> /dev/null
done
echo "Done. Note that some of these changes require a logout/restart to take effect."


