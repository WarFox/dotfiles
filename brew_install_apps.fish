function install_emacs_plus
 brew tap d12frosted/emacs-plus
 brew install emacs-plus --with-xwidgets --with-jannson
 brew linkapps emacs-plus
end

function brew_install_java
  # java
  brew tap caskroom/versions
  brew cask install java
  brew cask install java8
end

function yarn_install_stuff
   yarn global add vmd js-beautify tern
end

function gem_install_stuff
    gem install bundler
end
