# LDFLAGS refers for linker flags and is often user defined librarie $LDFLAGSs
# CPPLAGS is used by the preprocessor and is often the include directory

# ==> zlib
set -gx LDFLAGS "-L/usr/local/opt/zlib/lib $LDFLAGS $LDFLAGS $LDFLAGS"
set -gx CPPFLAGS "-I/usr/local/opt/zlib/include $CPPFLAGS"
set -gx PKG_CONFIG_PATH "/usr/local/opt/zlib/lib/pkgconfig $PKG_CONFIG_PATH"

# ==> libffi
# libffi is keg-only, which means it was not symlinked into /usr/local,
# because macOS already provides this software and installing another version in
# parallel can cause all kinds of trouble.

# For compilers to find libffi you may need to set:
set -gx LDFLAGS "-L/usr/local/opt/libffi/lib $LDFLAGS"
set -gx CPPFLAGS "-I/usr/local/opt/libffi/include $CPPFLAGS"

# For pkg-config to find libffi you may need to set:
set -gx PKG_CONFIG_PATH "/usr/local/opt/libffi/lib/pkgconfig $PKG_CONFIG_PATH"


# # ==> openssl@1.1
# A CA file has been bootstrapped using certificates from the system
# keychain. To add additional certificates, place .pem files in
#   /usr/local/etc/openssl@1.1/certs
# and run
#   /usr/local/opt/openssl@1.1/bin/c_rehash

# openssl@1.1 is keg-only, which means it was not symlinked into /usr/local,
# because macOS provides LibreSSL.

# If you need to have openssl@1.1 first in your PATH run:
# echo 'set -g fish_user_paths "/usr/local/opt/openssl@1.1/bin" $fish_user_paths' >> ~/.config/fish/config.fish

# For compilers to find openssl@1.1 you may need to set:
set -gx LDFLAGS "-L/usr/local/opt/openssl@1.1/lib $LDFLAGS"
set -gx CPPFLAGS "-I/usr/local/opt/openssl@1.1/include $CPPFLAGS"

# For pkg-config to find openssl@1.1 you may need to set:
set -gx PKG_CONFIG_PATH "/usr/local/opt/openssl@1.1/lib/pkgconfig $PKG_CONFIG_PATH"


# ==> imagemagick@6
# imagemagick@6 is keg-only, which means it was not symlinked into /usr/local,
# because this is an alternate version of another formula.

# If you need to have imagemagick@6 first in your PATH run:
  # echo 'set -g fish_user_paths "/usr/local/opt/imagemagick@6/bin" $fish_user_paths' >> ~/.config/fish/config.fish

# For compilers to find imagemagick@6 you may need to set:
set -gx LDFLAGS "-L/usr/local/opt/imagemagick@6/lib $LDFLAGS"
set -gx CPPFLAGS "-I/usr/local/opt/imagemagick@6/include $CPPFLAGS"

# For pkg-config to find imagemagick@6 you may need to set:
set -gx PKG_CONFIG_PATH "/usr/local/opt/imagemagick@6/lib/pkgconfig $PKG_CONFIG_PATH"


# ==> icu4c
# icu4c is keg-only, which means it was not symlinked into /usr/local,
# because macOS provides libicucore.dylib (but nothing else).

# If you need to have icu4c first in your PATH run:
#   echo 'set -g fish_user_paths "/usr/local/opt/icu4c/bin" $fish_user_paths' >> ~/.config/fish/config.fish
#   echo 'set -g fish_user_paths "/usr/local/opt/icu4c/sbin" $fish_user_paths' >> ~/.config/fish/config.fish

# For compilers to find icu4c you may need to set:
set -gx LDFLAGS "-L/usr/local/opt/icu4c/lib $LDFLAGS"
set -gx CPPFLAGS "-I/usr/local/opt/icu4c/include $CPPFLAGS"

# For pkg-config to find icu4c you may need to set:
set -gx PKG_CONFIG_PATH "/usr/local/opt/icu4c/lib/pkgconfig $PKG_CONFIG_PATH"


# ==> ncurses
# ncurses is keg-only, which means it was not symlinked into /usr/local,
# because macOS already provides this software and installing another version in
# parallel can cause all kinds of trouble.

# If you need to have ncurses first in your PATH run:
#   echo 'set -g fish_user_paths "/usr/local/opt/ncurses/bin" $fish_user_paths' >> ~/.config/fish/config.fish

# For compilers to find ncurses you may need to set:
set -gx LDFLAGS "-L/usr/local/opt/ncurses/lib $LDFLAGS"
set -gx CPPFLAGS "-I/usr/local/opt/ncurses/include $CPPFLAGS"

# For pkg-config to find ncurses you may need to set:
set -gx PKG_CONFIG_PATH "/usr/local/opt/ncurses/lib/pkgconfig $PKG_CONFIG_PATH"


# ==> openjdk
# For the system Java wrappers to find this JDK, symlink it with
#   sudo ln -sfn /usr/local/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk

# openjdk is keg-only, which means it was not symlinked into /usr/local,
# because it shadows the macOS `java` wrapper.

# If you need to have openjdk first in your PATH run:
#   echo 'set -g fish_user_paths "/usr/local/opt/openjdk/bin" $fish_user_paths' >> ~/.config/fish/config.fish

# For compilers to find openjdk you may need to set:
set -gx CPPFLAGS "-I/usr/local/opt/openjdk/include $CPPFLAGS"
