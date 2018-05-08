#!/bin/bash

# It's worth noting that I go in with mate-tweak and change the layout
# to 'Redmond' or 'Netbook' rather than the two-bar classic setup;
# this does enough 'stuff' that it's easier to just use mate-tweak.

# Set up monospace font
dconf write /org/mate/desktop/interface/monospace-font-name "'PragmataPro Mono 10.5'"

# Set up mate-terminal
dconf write /org/mate/terminal/profiles/default/use-system-font true
dconf write /org/mate/terminal/profiles/default/use-custom-default-size true
dconf write /org/mate/terminal/profiles/default/default-show-menubar false
dconf write /org/mate/terminal/profiles/default/default-size-columns "100"
dconf write /org/mate/terminal/profiles/default/default-size-rows "35"
dconf write /org/mate/terminal/profiles/default/use-theme-colors false
dconf write /org/mate/terminal/profiles/default/background-color "'#000000000000'"
dconf write /org/mate/terminal/profiles/default/foreground-color "'#FFFFFFFFFFFF'"
dconf write /org/mate/terminal/profiles/default/background-type "'transparent'"
dconf write /org/mate/terminal/profiles/default/background-darkness "0.9"
dconf write /org/mate/terminal/profiles/default/scrollbar-position "'hidden'"
dconf write /org/mate/terminal/profiles/default/scrollback-lines "65535"

# Set up virtual desktops
dconf write /org/mate/panel/objects/workspaceswitcherapplet/prefs/display-all-workspaces true
dconf write /org/mate/panel/objects/workspaceswitcherapplet/prefs/num-rows "1"
dconf write /org/mate/marco/general/num-workspaces "10"

# Set up time
dconf write /org/mate/panel/objects/clockapplet/prefs/format "'24-hour'"
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
action='rofi -show run -display-run ">>> "'
binding='<Mod4>space'
name='Rofi (Run)'

[custom2]
action='emacsclient -c -n --alternate-editor=""'
binding='<Mod4>e'
name='Emacs Client'
SETTINGS
