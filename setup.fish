#!/usr/bin/env fish

set fish_trace 1

function _clone_repos

  git clone git@github.com:syl20bnr/spacemacs ~/Workspace/github.com/syl20bnr/spacemacs
  git clone git@github.com:hlissner/doom-emacs ~/Workspace/github.com/hlissner/doom-emacs
  git clone git@github.com:plexus/chemacs2 ~/.emacs.d
  git clone git@github.com:WarFox/spacemacs.d ~/Workspace/github.com/WarFox/spacemacs.d
  git clone git@github.com:WarFox/doom.d ~/Workspace/github.com/WarFox/doom.d
  git clone git@github.com:dracula/alacritty ~/Workspace/github.com/dracula/alacritty
end

function _setup_symlinks
  ln -vfs ~/Workspace/github.com/WarFox/spacemacs.d/ ~/.spacemacs.d
  ln -vfs ~/Workspace/github.com/WarFox/doom.d/ ~/.doom.d
  ln -vfs $DOTFILES/.config/alacritty/alacritty.toml ~/.config/alacritty
  ln -vfs $DOTFILES/.config/starship.toml ~/.config/starship.toml

  set exclude ".git" ".gitignore" ".gitignore_global" ".DS_Store"
  for f in .*
      if test -f $f
          if not contains $f $exclude
              ln -vfs $DOTFILES/$f ~
          end
      end
  end
end

function setup_nu
    ln -vfs $DOTFILES/.config/fish/*.fish ~/.config/fish
end

function _setup_fish
  curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher

  ln -vfs $DOTFILES/.config/fish/*.fish ~/.config/fish
  ln -vfs $DOTFILES/.config/fish/fish_plugins ~/.config/fish/fish_plugins
  ln -vfs $DOTFILES/.config/fish/conf.d/*.fish ~/.config/fish/conf.d
  ln -vfs $DOTFILES/.config/fish/functions/*.fish ~/.config/fish/functions
  fisher update
end

function yarn_install_stuff
    npm install -g vmd js-beautify tern
end

function gem_install_stuff
    gem install bundler
end

function main -a _name

   switch $_name
       case "fish"
           _setup_fish
       case "symlinks"
           _setup_symlinks
       case "*"
          _clone_repos
          _setup_fish
          _setup_symlinks

          # Set up global git-ignore
          git config --global core.excludesfile ~/.gitignore_global

          # add  /usr/local/bin/fish to /etc/shells
          set chsh_command chsh -s /usr/local/bin/fish
          echo "to change default shell run $chsh_commmand"

          brew bundle -v
    end
end

main $argv
