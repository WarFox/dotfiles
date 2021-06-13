function setup-oh-my-tmux
    git clone https://github.com/gpakosz/.tmux.git ~/Workspace/github.com/.tmux
    ln -f -s ~/Workspace/github.com/.tmux/.tmux.conf ~/.tmux.conf
    ln -f -s ~/Workspace/Personal/dotfiles/.tmux.conf.local ~/.tmux.conf.local
    mkdir -p ~/.tmux/plugins/
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
end
