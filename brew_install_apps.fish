function install_fonts
    # Setup fonts
    brew tap caskroom/fonts
    brew cask install font-sourcecodepro-nerd-font font-sourcecodepro-nerd-font-mono font-hack-nerd-font font-hack-nerd-font-mono
end

function install_emacs_plus
 brew tap d12frosted/emacs-plus
 brew install emacs-plus
 brew linkapps emacs-plus
end

function brew_install_java
  # java
  brew tap caskroom/versions
  brew cask install java
  brew cask install java8
end

function brew_install_stuff
  brew install apache-spark
  brew install aspell
  brew install awscli
  brew install boot-clj
  brew install cmake
  brew install coreutils
  brew install gnutls
  brew install golang
  brew install gpg2
  brew install gradle
  brew install guile
  brew install htop
  brew install httpie
  brew install hub
  brew install languagetool
  brew install leiningen
  brew install markdown
  brew install meghanada-server
  brew install neovim/neovim/neovim
  brew install nodejs
  brew install pstree
  brew install pyenv
  brew install ruby-build rbenv
  brew install reattach-to-user-namespace
  # search tools
  brew install ripgrep sift pt ag
  brew install sbcl
  brew install sbt
  brew install thefuck
  brew install tig
  brew install tmux
  brew install tree
  brew install wget
  brew install yarn
  brew install z
end

function brew_cask_install_stuff
  brew cask install atom
  brew cask install alfred
  brew cask install docker
  brew cask install dropbox
  brew cask install firefox
  brew cask install gitter
  brew cask install google-chrome
  brew cask install google-drive
  brew cask install jprofiler
  brew cask install keybase
  brew cask install kitematic
  brew cask install mactex
  brew cask install postman
  brew cask install skype
  brew cask install spotify
  brew cask install virtualbox
  brew cask install visual-studio-code
end

function yarn_install_stuff
   yarn global add vmd js-beautify tern
end

function omf_install_stuff
   omf install z simple-ass-prompt fuck
end

function gem_install_stuff
    gem install bundler
end
