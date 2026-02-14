#!/usr/bin/env bash

echo $'Configuring macOS...\n'

####################################################################################################
# General Settings
####################################################################################################

# Disable window restore when app is quit
# idk what this does tbh
# defaults write com.apple.systempreferences NSQuitAlwaysKeepsWindows -bool false

# Disable automatic capitalization as it's annoying when typing code
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# Disable smart dashes as they're annoying when typing code
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# Disable automatic period substitution as it's annoying when typing code
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

# Disable smart quotes as they're annoying when typing code
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# Disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# Only show scrollbars when scrolling
defaults write NSGlobalDomain AppleShowScrollBars -string "WhenScrolling"

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Expand print panel by default
# this doesn't do anything anymore
# defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
# defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# Save to disk (not to iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Allow UI controls to be controlled with keyboard (i.e, tabbing)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 2

# Disable press-and-hold for keys in favor of key repeat
# Default will let you press-and-hold for an accent
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

####################################################################################################
# Dock
####################################################################################################

# Don't show recent applications in Dock
defaults write com.apple.dock show-recents -bool false

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Set the icon size of Dock items to 58 pixels
defaults write com.apple.dock tilesize -int 58

# Use scale effect to minimize windows
defaults wrie com.apple.dock mineffect -string "scale"

killall Dock

####################################################################################################
# Finder
####################################################################################################

# Don't show media on the desktop
# ion want this anymore
# defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false
# defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
# defaults write com.apple.finder ShowMountedServersOnDesktop -bool false
# defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false

# Show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Show status bar in Finder
defaults write com.apple.finder ShowStatusBar -bool true

# Show path bar in Finder
defaults write com.apple.finder ShowPathbar -bool true

# Keep folders on top when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Enable spring loading for directories
defaults write NSGlobalDomain com.apple.springing.enabled -bool true

# Show the ~/Library folder
# idk if this works
# chflags nohidden ~/Library && xattr -d com.apple.FinderInfo ~/Library

killall Finder

####################################################################################################
# Other Apps
####################################################################################################

# Save screenshots to the desktop
# i think this is the default now
# defaults write com.apple.screencapture location -string "${HOME}/Desktop"

# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
defaults write com.apple.screencapture type -string "png"

# Disable shadow in screenshots
defaults write com.apple.screencapture disable-shadow -bool true

# Use plain text mode for new TextEdit documents
defaults write com.apple.TextEdit RichText -int 0

# Open and save files as UTF-8 in TextEdit
defaults write com.apple.TextEdit PlainTextEncoding -int 4
defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4

killall TextEdit

echo 'macOS configuration is complete! Restart for all changes to take effect.'
