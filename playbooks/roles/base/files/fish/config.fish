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

# Dracula colors, slightly edited
set -U fish_color_normal normal
set -U fish_color_command F8F8F2
set -U fish_color_quote F1FA8C
set -U fish_color_redirection 8BE9FD
set -U fish_color_end 50FA7B
set -U fish_color_error FFB86C
set -U fish_color_param FF79C6
set -U fish_color_comment 6272A4
set -U fish_color_search_match bryellow --background=brblack
set -U fish_color_history_current --bold
set -U fish_color_operator 00a6b2
set -U fish_color_escape 00a6b2
set -U fish_color_cwd green
set -U fish_color_cwd_root red
set -U fish_color_valid_path --underline
set -U fish_color_autosuggestion BD93F9
set -U fish_color_user brgreen
set -U fish_color_host normal
set -U fish_color_cancel -r
set -U fish_pager_color_completion normal
set -U fish_pager_color_description B3A06D yellow
set -U fish_pager_color_prefix white --bold --underline
set -U fish_pager_color_progress brwhite --background=cyan
set -U fish_color_selection white --bold --background=brblack
set -U fish_color_match --background=brblue

# Settings for the hydro prompt
set --global hydro_color_prompt brmagenta
set --global hydro_color_pwd brcyan
set --global hydro_color_git brblue
set --global hydro_color_error brred
set --global hydro_color_duration brgreen