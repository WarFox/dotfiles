#!/usr/bin/env fish

source ./brew_install_apps.fish

brew_tap
brew_install_stuff
brew_services

function spacemacs_link
  git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
  ln -s ~/Workspace/Personal/dotfiles/spacemacs.d ~/.spacemacs.d
end

install_emacs_plus
spacemacs_link
