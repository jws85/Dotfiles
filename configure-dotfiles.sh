#!/bin/bash

# zsh (using oh-my-zsh)
if [ ! -d ~/.oh-my-zsh ]; then
    git clone https://github.com/robbyrussell/oh-my-zsh ~/.oh-my-zsh
fi

# gdb (using https://github.com/cyrus-and/gdb-dashboard)
curl -fLo ~/.gdbinit https://git.io/.gdbinit
