#!/usr/bin/env fish

source ./brew_install_apps.fish

brew_install_java

function clone_spacemacs
  git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
end

function setup_softlinks
  ln -s ~/Workspace/Personal/dotfiles/spacemacs.d ~/.spacemacs.d
  ln -s ~/Workspace/Personal/dotfiles/.jsbeautifyrc ~/.jsbeautifyrc
  ln -s ~/Workspace/Personal/dotfiles/.sift.conf ~/.sift.conf
  ln -s ~/Workspace/Personal/dotfiles/.gitignore_global ~/.gitignore_global
  ln -s ~/Workspace/Personal/dotfiles/.chunkwmrc ~/.chunkwmrc
end

function setup_oh_my_tmux
    git clone https://github.com/gpakosz/.tmux.git ~/Workspace/GitHub/.tmux
    ln -s ~/Workspace/GitHub/.tmux/.tmux.conf ~/.tmux.conf
    ln -s ~/Workspace/Personal/dotfiles/.tmux.conf.local ~/.tmux.conf.local
    brew install tmux
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
end

# Set up global git-ignore
git config --global core.excludesfile ~/.gitignore_global

install_fonts

# Emacs
install_emacs_plus
clone_spacemacs
setup_softlinks

brew_install_stuff
brew_cask_install_stuff
yarn_install_stuff
omf_install_stuff
gem_install_stuff
