#!/usr/bin/env sh

git submodule init
git submodule update

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew cask install iterm2

brew install fish
curl -L https://get.oh-my.fish | fish

# add  /usr/local/bin/fish to /etc/shells
chsh -s /usr/local/bin/fish
