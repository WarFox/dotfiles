# ==> libflags
set dir (dirname (status -f))
source $dir/libflags.fish

# Get gnu grep in path
fish_add_path /usr/local/opt/grep/libexec/gnubin

# rbenv
status is-interactive; and source (rbenv init - | psub)

# jenv
status is-interactive; and source (jenv init - | psub)

# blast off with starship
source (starship init fish | psub)

# direnv
source (direnv hook fish | psub)

# pyenv
set -Ux PYENV_ROOT $HOME/.pyenv
fish_add_path $PYENV_ROOT
status is-login; fish_add_path $PYENV_ROOT/shims
status is-interactive; and source (pyenv init - | psub)

# pyenv-virtualenv
status is-interactive; and source (pyenv virtualenv-init - | psub)

# local settings and overrides
if test -f $dir/config.local.fish
    source $dir/config.local.fish
end
