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

# S-1..S-0: Switch to desktop 1..10
dconf write /org/mate/marco/global-keybindings/switch-to-workspace-1 "'<Mod4>1'"
dconf write /org/mate/marco/global-keybindings/switch-to-workspace-2 "'<Mod4>2'"
dconf write /org/mate/marco/global-keybindings/switch-to-workspace-3 "'<Mod4>3'"
dconf write /org/mate/marco/global-keybindings/switch-to-workspace-4 "'<Mod4>4'"
dconf write /org/mate/marco/global-keybindings/switch-to-workspace-5 "'<Mod4>5'"
dconf write /org/mate/marco/global-keybindings/switch-to-workspace-6 "'<Mod4>6'"
dconf write /org/mate/marco/global-keybindings/switch-to-workspace-7 "'<Mod4>7'"
dconf write /org/mate/marco/global-keybindings/switch-to-workspace-8 "'<Mod4>8'"
dconf write /org/mate/marco/global-keybindings/switch-to-workspace-9 "'<Mod4>9'"
dconf write /org/mate/marco/global-keybindings/switch-to-workspace-10 "'<Mod4>0'"

# S-s-1..S-s-0: Move window to desktop 1..10
dconf write /org/mate/marco/window-keybindings/move-to-workspace-1 "'<Shift><Mod4>exclam'"
dconf write /org/mate/marco/window-keybindings/move-to-workspace-2 "'<Shift><Mod4>at'"
dconf write /org/mate/marco/window-keybindings/move-to-workspace-3 "'<Shift><Mod4>numbersign'"
dconf write /org/mate/marco/window-keybindings/move-to-workspace-4 "'<Shift><Mod4>dollar'"
dconf write /org/mate/marco/window-keybindings/move-to-workspace-5 "'<Shift><Mod4>percent'"
dconf write /org/mate/marco/window-keybindings/move-to-workspace-6 "'<Shift><Mod4>asciicircum'"
dconf write /org/mate/marco/window-keybindings/move-to-workspace-7 "'<Shift><Mod4>ampersand'"
dconf write /org/mate/marco/window-keybindings/move-to-workspace-8 "'<Shift><Mod4>asterisk'"
dconf write /org/mate/marco/window-keybindings/move-to-workspace-9 "'<Shift><Mod4>parenleft'"
dconf write /org/mate/marco/window-keybindings/move-to-workspace-10 "'<Shift><Mod4>parenright'"

# S-Left/S-Right: Switch to desktop on left/right
dconf write /org/mate/marco/global-keybindings/switch-to-workspace-left "'<Mod4>Left'"
dconf write /org/mate/marco/global-keybindings/switch-to-workspace-right "'<Mod4>Right'"
dconf write /org/mate/marco/global-keybindings/switch-to-workspace-up "'<Mod4>Up'"
dconf write /org/mate/marco/global-keybindings/switch-to-workspace-down "'<Mod4>Down'"

# S-s-Left/S-s-Right: Move window to desktop on left/right
dconf write /org/mate/marco/window-keybindings/move-to-workspace-left "'<Shift><Mod4>Left'"
dconf write /org/mate/marco/window-keybindings/move-to-workspace-right "'<Shift><Mod4>Right'"
dconf write /org/mate/marco/window-keybindings/move-to-workspace-up "'<Shift><Mod4>Up'"
dconf write /org/mate/marco/window-keybindings/move-to-workspace-down "'<Shift><Mod4>Down'"

# S-Tab: Swap to most recently used desktop
dconf write /org/mate/marco/global-keybindings/switch-to-workspace-prev "'<Mod4>Tab'"

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
