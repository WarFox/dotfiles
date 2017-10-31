#!/usr/bin/env fish

source ./brew_install_apps.fish

brew_tap
brew_install_stuff
brew_services

function clone_spacemacs
  git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
end

function setup_softlinks
  ln -s ~/Workspace/Personal/dotfiles/spacemacs.d ~/.spacemacs.d
  ln -s ~/Workspace/Personal/dotfiles/.jsbeautifyrc ~/.jsbeautifyrc
end

# Set up global git-ignore
echo "TODOs.org" >> ~/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global

install_emacs_plus
clone_spacemacs
setup_softlinks
