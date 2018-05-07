#!/bin/bash

# tmux
if [ ! -f ~/.tmux.conf ]; then
    (cd ~/Dotfiles && stow tmux)
fi

# zsh (using oh-my-zsh)
if [ ! -d ~/.oh-my-zsh ]; then
    git clone https://github.com/robbyrussell/oh-my-zsh ~/.oh-my-zsh
    (cd ~/Dotfiles && stow zsh)
fi

# emacs
if [ ! -d ~/.emacs.d ]; then
    git clone https://github.com/jws85/.emacs.d.git ~/.emacs.d
fi

# vim
if [ ! -d ~/.vim ]; then
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    (cd ~/Dotfiles && stow vim)
fi

# git
(cd ~/Dotfiles/ && stow git)

# rofi
(cd ~/Dotfiles && stow rofi)

# Xdefaults (likely not necessary with MATE, but hey)
(cd ~/Dotfiles && stow xdefaults)

# gdb (using https://github.com/cyrus-and/gdb-dashboard)
curl -fLo ~/.gdbinit https://git.io/.gdbinit
