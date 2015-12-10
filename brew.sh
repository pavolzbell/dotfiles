#!/usr/bin/env bash

#
# TODO get rid of brew.sh in favor of homebrew-bundle, see https://github.com/Homebrew/homebrew-bundle
#

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.osx` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

brew update
brew upgrade --all

# Add taps
brew tap caskroom/cask
brew tap caskroom/fonts
brew tap homebrew/versions
brew tap homebrew/x11

# Install GNU utilities (those that come with OS X are outdated)
brew install coreutils
brew install moreutils
brew install findutils
brew install gnu-sed --with-default-names
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Install updated versions of some OS X tools
brew install vim --override-system-vi
brew install wget --with-iri
brew install homebrew/dupes/grep
brew install homebrew/dupes/openssh
brew install homebrew/dupes/screen

# Install shells
brew install bash
brew install fish

# Install Git
brew install git
brew install git-lfs

# Install libraries
brew install libexif
brew install libpng
brew install libusb
brew install libxml2
brew install libyaml

# Install others
brew install ack
brew install htop-osx
brew install mc
brew install ncdu
brew install nmap
brew install p7zip
brew install rename
brew install tree
brew install unrar
brew install xz

# TODO wait for rbenv 1.0.0 available at homebrew
# Install Ruby
#brew install rbenv
#brew install rbenv-bundler
#brew install ruby-build

brew cleanup

# TODO
# consider creating an extension to this file to install:
# rbenv, ruby-build, pry
# elasticsearch, postgresql
# google-chrome
# atom, rubymine, dia, pgadmin3
# font-fontawesome, font-octicons, font-open-sans
# maven
# Caskroom/cask/java
# Caskroom/cask/eclipse-platform
