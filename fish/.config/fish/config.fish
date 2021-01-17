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

alias x=exit
