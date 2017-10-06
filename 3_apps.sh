#!/bin/bash

read -r -p "Are you sure? [Y/n]" response
if [[ $response =~ ^(yes|y|Y| ) ]]; then

brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv betterzipql qlimagesize webpquicklook
brew cask install suspicious-package
brew cask install appcleaner
brew cask install cakebrew
brew cask install caffeine
brew cask install clipmenu
brew cask install coconutbattery
brew cask install firefox
brew cask install google-chrome
brew cask install keepassx
brew cask install keka
brew cask install linkliar
brew cask install maintenance
brew cask install mysqlworkbench
brew cask install onyx
brew cask install virtualbox
brew cask install virtualbox-extension-pack
brew cask install sequel-pro
brew cask install shiftit
brew cask install teamviewer
brew cask install tunnelblick
brew cask install imageoptim
brew cask install sublime-text
brew cask install transmission
brew cask install vagrant
brew cask install vlc
brew cask install valentina-studio
brew cask install xtrafinder
brew cask install xquartz
brew cask install java
brew cask install nextcloud
brew cask install iterm2
brew cask install ssh-tunnel-manager
brew cask install filezilla
brew cask install grandperspective
brew cask install timemachineeditor
brew cask install rambox
brew cask install skype
brew cask install spotify
brew cask install flash-player
brew cask install veracrypt
brew cask install plistedit-pro
brew cask install tigervnc-viewer

brew cask cleanup

fi