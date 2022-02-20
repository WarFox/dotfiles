#!/usr/bin/env bash

set +x

echo "Setup script is running"

if ! command -v brew /dev/null
then
    echo "brew could not be found, attempting to install it now"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

if ! command -v fish /dev/null
then
    echo "Installing fish"
    brew install fish
fi

echo "Continuing setup with fish"

export DOTFILES=~/Workspace/github.com/WarFox/dotfiles

git clone git@github.com:WarFox/dotfiles $DOTFILES

cd $DOTFILES

./setup.fish
