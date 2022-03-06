function setup-oh-my-tmux
    git clone https://github.com/gpakosz/.tmux.git ~/Workspace/github.com/gpakosz/.tmux
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    ln -vfs ~/Workspace/github.com/gpakosz/.tmux/.tmux.conf ~/.tmux.conf
    ln -vfs ~/Workspace/github.com/WarFox/dotfiles/.tmux.conf.local ~/.tmux.conf.local
end
