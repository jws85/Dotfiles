set -g theme_date_format "+%m.%d %H:%M:%S"
set PATH ~/.local/bin $PATH

# See https://github.com/fish-shell/fish-shell/issues/1891#issuecomment-451961517
function expand-dot-to-parent-directory-path -d 'expand ... to ../.. etc'
    # Get commandline up to cursor
    set -l cmd (commandline --cut-at-cursor)

    # Match last line
    switch $cmd[-1]
        case '*..'
            commandline --insert '/.'
        case '*'
            commandline --insert '.'
    end
end

# From the fish manual: file:///usr/share/doc/fish/index.html#command-line-editor
function hybrid_bindings --description "Vi-style bindings that inherit emacs-style bindings in all modes"
    for mode in default insert visual
        fish_default_key_bindings -M $mode
    end
    fish_vi_key_bindings --no-erase
    # Any other relevant bindings should go below:
    # Add the code to expand ... to ../..
    bind . expand-dot-to-parent-directory-path
end
set -g fish_key_bindings hybrid_bindings

# Set the text that is printed upon first opening the shell
function fish_greeting
    hostname | figlet -f smslant | lolcat
    uptime | xargs
    echo
    fortune
end

# Load site-specific settings
for file in ~/.config/fish/local/*
    source $file
end

# Use starship prompt
starship init fish | source

# Use dracula colors
set -g fish_color_normal normal
set -g fish_color_command F8F8F2
set -g fish_color_quote F1FA8C
set -g fish_color_redirection 8BE9FD
set -g fish_color_end 50FA7B
set -g fish_color_error FFB86C
set -g fish_color_param FF79C6
set -g fish_color_selection white --bold --background=brblack
set -g fish_color_search_match bryellow --background=brblack
set -g fish_color_history_current --bold
set -g fish_color_operator 00a6b2
set -g fish_color_escape 00a6b2
set -g fish_color_cwd green
set -g fish_color_cwd_root red
set -g fish_color_valid_path --underline
set -g fish_color_autosuggestion BD93F9
set -g fish_color_user brgreen
set -g fish_color_host normal
set -g fish_color_cancel -r
set -g fish_pager_color_completion normal
set -g fish_pager_color_description B3A06D yellow
set -g fish_pager_color_prefix white --bold --underline
set -g fish_pager_color_progress brwhite --background=cyan
set -g fish_color_comment 6272A4
set -g fish_color_match --background=brblue
