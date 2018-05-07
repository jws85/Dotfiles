#!/bin/bash

## MATE Settings ###############################################################

# Set 24-hour time
dconf write /org/mate/panel/objects/clockapplet/prefs/format "'24-hour'"

# Show the date
dconf write /org/mate/panel/objects/clockapplet/prefs/show-date true

# Swap CapsLock and Control
# Make the right Alt key a Compose key
dconf write /org/mate/desktop/peripherals/keyboard/kbd/options "['ctrl\tctrl:swapcaps', 'Compose key\tcompose:ralt']"

# S-SPC: Rofi in run (application) mode
# S-RET: Open a new terminal
# S-e: Open a new Emacs frame
dconf load /org/mate/desktop/keybindings/ <<SETTINGS
[custom0]
action='mate-terminal'
binding='<Mod4>Return'
name='Terminal'

[custom1]
action='zsh -c "rofi -show run"'
binding='<Mod4>space'
name='Rofi (Run)'

[custom2]
action='zsh -c "emacsclient -c -n --alternate-editor=\"\""'
binding='<Mod4>e'
name='Emacs Client'
SETTINGS

## Startup Applications ######################################################

