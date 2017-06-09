#!/usr/bin/env fish

source ./brew_install_apps.fish

brew_tap
brew_install_stuff
brew_cask_install_stuff
brew_services

function spacemacs_link
  ln -s ~/Workspace/Personal/dotfiles/spacemacs.d/ ~/.spacemacs.d
end

spacemacs_link
