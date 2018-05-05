#!/bin/bash

# Install oh-my-zsh
if [ ! -d ~/.oh-my-zsh ]; then
    git clone https://github.com/robbyrussell/oh-my-zsh ~/.oh-my-zsh
fi

# Install my emacs settings
if [ ! -d ~/.emacs.d ]; then
    git clone https://github.com/jws85/.emacs.d.git ~/.emacs.d
fi

# Set up git
git config --global user.name "J. W. Smith"
git config --global user.email "jwsmith2spam at gmail dot com"
git config --global core.editor vim
git config --global push.default simple
git config --global alias.lg "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative --all"
