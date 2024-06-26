# ==> libflags
set dir (dirname (status -f))
source $dir/libflags.fish

# Erase fish_user_paths universal variable
# set --erase fish_user_paths

# Get gnu grep in path
fish_add_path /usr/local/opt/grep/libexec/gnubin
fish_add_path /usr/local/opt/libxml2/bin
fish_add_path ~/.cargo/bin
fish_add_path /opt/local/bin
fish_add_path /usr/local/bin

# pyenv
set -Ux PYENV_ROOT $HOME/.pyenv

status is-interactive \
    ; and source (rbenv init - | psub) \
    ; and source (starship init fish | psub) \
    ; and source (direnv hook fish | psub) \
    ; and source (zoxide init fish | psub) \
    ; and source (pyenv virtualenv-init - | psub) \
    ; and source (pyenv init - | psub)

[ -s "/usr/local/opt/jabba/share/jabba/jabba.fish" ]; and source "/usr/local/opt/jabba/share/jabba/jabba.fish"

set -x GPG_TTY (tty)

if test -z (pgrep ssh-agent | tr '\n' ',')
    eval (ssh-agent -c) > /dev/null
end

alias ls lsd

# local settings and overrides
if test -f $dir/config.local.fish
    source $dir/config.local.fish
end
