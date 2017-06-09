function brew_tap
  brew tap pivotal/tap
end

function brew_install_extra_stuff
  brew insall lynx
  brew install ant
end

function brew_install_stuff
  brew install Caskroom/cask/wercker-cli
  brew install apache-spark
  brew install awscli
  brew install boot-clj
  brew install chicken
  brew install coreutils
  brew install docker
  brew install eclim
  brew install gnutls
  brew install golang
  brew install gpg
  brew install gradle
  brew install guile
  brew install heroku
  brew install hsqldb
  brew install htop
  brew install httpie
  brew install hub
  brew install ispell
  brew install languagetool
  brew install leiningen
  brew install markdown
  brew install maven
  brew install meghanada-server
  brew install mesos
  brew install neovim/neovim/neovim
  brew install pip
  brew install pstree
  brew install pyenv
  brew install python
  brew install rbenv
  brew install sbcl
  brew install sbt
  brew install scala
  brew install scala@2.11
  brew install sift pt
  brew install spring-boot
  brew install thefuck
  brew install tig
  brew install travis
  brew install tree
  brew install tyk
  brew install typesafe-activator
  brew install wercker
  brew install wget
  brew install yarn
  brew install z
end

function brew_cask_install_stuff
  brew cask install VirtualBox
  brew cask install apache-spark
  brew cask install atom
  brew cask install docker
  brew cask install dropbox
  brew cask install eclipse-java
  brew cask install firefox
  brew cask install gitter
  brew cask install google-chrome
  brew cask install google-drive
  brew cask install java
  brew cask install jprofiler
  brew cask install keycastr
  brew cask install kitematic
  brew cask install mactex
  brew cask install opera
  brew cask install origami
  brew cask install postman
  brew cask install skype
  brew cask install sourcetree
  brew cask install spotify
  brew cask install sublime-text
  brew cask install virtualbox
  brew cask install visual-studio-code
  brew cask install vivaldi
end

function brew_services
  brew services start emacs-plus
end

function brew_upgrades
  brew upgrade emacs-plus
  brew upgrade maven
  brew upgrade sbt
end
