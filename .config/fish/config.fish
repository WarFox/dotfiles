# ==> libflags
set dir (dirname (status -f))
source $dir/libflags.fish

# Get gnu grep in path
fish_add_path /usr/local/opt/grep/libexec/gnubin
fish_add_path /usr/local/opt/libxml2/bin
fish_add_path ~/.cargo/bin

# pyenv
set -Ux PYENV_ROOT $HOME/.pyenv
fish_add_path $PYENV_ROOT
status is-login; fish_add_path $PYENV_ROOT/shims

status is-interactive \
    ; and source (rbenv init - | psub) \
    ; and source (jenv init - | psub) \
    ; and source (starship init fish | psub) \
    ; and source (direnv hook fish | psub) \
    ; and source (zoxide init fish | psub) \
    ; and source (pyenv virtualenv-init - | psub) \
    ; and source (pyenv init - | psub)

# local settings and overrides
if test -f $dir/config.local.fish
    source $dir/config.local.fish
end
