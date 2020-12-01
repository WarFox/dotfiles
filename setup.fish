#!/usr/bin/env fish

git clone git@github.com:syl20bnr/spacemacs.git ~/Workspace/GitHub/syl20bnr/spacemacs
git clone git@github.com:hlissner/doom-emacs.git ~/Workspace/GitHub/hlissner/doom-emacs
git clone git@github.com:plexus/chemacs.git ~/Workspace/GitHub/plexus/chemacs
~/Workspace/GitHub/plexus/chemacs/install.sh

function make_links -a source_dir target_dir -d "make links for multiple files in the directory"
    for f in $source_dir/*;
        if test -f $f
            echo ln -s $f $target_dir/(basename $f)
            ln -s $f $target_dir/(basename $f)
        end
    end
end

function setup_softlinks
  ln -s ~/Workspace/Personal/spacemacs.d ~/.spacemacs.d
  ln -s ~/Workspace/Personal/doom.d ~/.doom.d
  ln -s ~/Workspace/Personal/dotfiles/.jsbeautifyrc ~/.jsbeautifyrc
  ln -s ~/Workspace/Personal/dotfiles/.sift.conf ~/.sift.conf
  ln -s ~/Workspace/Personal/dotfiles/.gitignore_global ~/.gitignore_global
  ln -s ~/Workspace/Personal/dotfiles/.chunkwmrc ~/.chunkwmrc
  ln -s ~/Workspace/Personal/dotfiles/.skhdrc ~/.skhdrc
  ln -s ~/Workspace/Personal/dotfiles/.emacs-profiles.el ~/.emacs-profiles.el
  ln -s ~/Workspace/Personal/dotfiles/.emacs-profile ~/.emacs-profile
  mkdir -p ~/.config/alacritty/
  ln -s ~/Workspace/Personal/dotfiles/.config/alacritty/alacritty.yml ~/.config/alacritty/


  make_links  ~/Workspace/Personal/dotfiles/.config/omf ~/.config/omf
end


function setup_oh_my_tmux
    git clone https://github.com/gpakosz/.tmux.git ~/Workspace/GitHub/.tmux
    ln -s ~/Workspace/GitHub/.tmux/.tmux.conf ~/.tmux.conf
    ln -s ~/Workspace/Personal/dotfiles/.tmux.conf.local ~/.tmux.conf.local
    mkdir -p ~/.tmux/plugins/
    brew install tmux
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
end

# Set up global git-ignore
git config --global core.excludesfile ~/.gitignore_global

source ./brew_install_apps.fish

brew bundle

setup_softlinks
yarn_install_stuff
omf_install_stuff
gem_install_stuff
