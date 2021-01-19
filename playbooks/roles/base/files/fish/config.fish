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
    echo
end

alias x=exit

# Load site-specific settings
if test -f ~/.config/fish/site.fish
    source ~/.config/fish/site.fish
end

# Settings for the hydro prompt
set --global hydro_color_prompt brmagenta
set --global hydro_color_pwd brcyan
set --global hydro_color_git brblue
set --global hydro_color_error brred
set --global hydro_color_duration brgreen