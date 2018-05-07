#!/bin/bash

# Install tmux
if [ ! -f ~/.tmux.conf ]; then
    (cd ~/Dotfiles && stow tmux)
fi

# Install oh-my-zsh
if [ ! -d ~/.oh-my-zsh ]; then
    git clone https://github.com/robbyrussell/oh-my-zsh ~/.oh-my-zsh
    (cd ~/Dotfiles && stow zsh)
fi

# Install my emacs settings
if [ ! -d ~/.emacs.d ]; then
    git clone https://github.com/jws85/.emacs.d.git ~/.emacs.d
fi

# Install my vim settings
if [ ! -d ~/.vim ]; then
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    (cd ~/Dotfiles && stow vim)
fi

# Set up git
(cd ~/Dotfiles/ && stow git)
