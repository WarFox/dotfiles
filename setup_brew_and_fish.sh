#!/usr/bin/env sh

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew cask install alacritty

brew install fish

# add  /usr/local/bin/fish to /etc/shells
chsh -s /usr/local/bin/fish
