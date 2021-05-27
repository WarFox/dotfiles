# ==> libflags
# set dir (dirname (status -f))
# source $dir/libflags.fish

# rbenv
# status --is-interactive; and source (rbenv init -|psub)

# ==> pyenv-virtualenv
# To enable auto-activation add to your profile:
status --is-interactive; and pyenv init - | source
status --is-interactive; and pyenv virtualenv-init - | source

# ==> jenv
# status --is-interactive; and source (jenv init -|psub)

# blast off with starship
starship init fish | source

# direnv hook
eval (direnv hook fish)

# ==> local settings and overrides
# source $dir/init.local.fish
