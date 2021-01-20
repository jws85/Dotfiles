set -g theme_date_format "+%m.%d %H:%M:%S"

# From the fish manual: file:///usr/share/doc/fish/index.html#command-line-editor
function hybrid_bindings --description "Vi-style bindings that inherit emacs-style bindings in all modes"
    for mode in default insert visual
        fish_default_key_bindings -M $mode
    end
    fish_vi_key_bindings --no-erase
end
set -g fish_key_bindings hybrid_bindings

# Set the text that is printed upon first opening the shell
function fish_greeting
    hostname | figlet -f smslant | lolcat
    uptime | xargs
    echo
    fortune
end

# Helpful aliases
function s
    fish_title "ssh " $argv
    set TERM xterm-256color
    ssh $argv
end

alias x=exit

# Load site-specific settings
for file in ~/.config/fish/local/*
    source $file
end

# Use starship prompt
starship init fish | source