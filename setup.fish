#!/usr/bin/env fish

git clone git@github.com:syl20bnr/spacemacs.git ~/Workspace/github.com/syl20bnr/spacemacs
git clone git@github.com:hlissner/doom-emacs.git ~/Workspace/github.com/hlissner/doom-emacs
git clone git@github.com:plexus/chemacs2.git ~/.emacs.d

function setup_softlinks
  ln -s ~/Workspace/Personal/spacemacs.d ~/.spacemacs.d
  ln -s ~/Workspace/Personal/doom.d ~/.doom.d

  # sym link dotfiles
  ln -s (pwd)/.chunkwmrc ~/.chunkwmrc
  ln -s (pwd)/.emacs-profile ~/.emacs-profile
  ln -s (pwd)/.emacs-profiles.el ~/.emacs-profiles.el
  ln -s (pwd)/.gitignore_global ~/.gitignore_global
  ln -s (pwd)/.jsbeautifyrc ~/.jsbeautifyrc
  ln -s (pwd)/.sift.conf ~/.sift.conf
  ln -s (pwd)/.skhdrc ~/.skhdrc

  ln -s (pwd)/.config/alacritty/alacritty.yml ~/.config/alacritty/
end

function setup_fish
  ln -vs (pwd)/.config/fish/*.fish ~/.config/fish
  ln -vs (pwd)/.config/fish/fish_plugins ~/.config/fish/fish_plugins
  ln -vs (pwd)/.config/fish/conf.d/*.fish ~/.config/fish/conf.d
  ln -vs (pwd)/.config/fish/functions/*.fish ~/.config/fish/functions

  curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
end

# Set up global git-ignore
git config --global core.excludesfile ~/.gitignore_global

source ./brew_install_apps.fish

brew bundle

setup_softlinks
yarn_install_stuff
gem_install_stuff
