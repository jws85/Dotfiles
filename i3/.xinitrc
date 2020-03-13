#!/bin/bash

# Swap Caps Lock and Control; set Right Alt to Compose
setxkbmap -option ctrl:swapcaps,compose:ralt

# Compositor
compton -b

# Notifications
dunst &

# Automount
udiskie --tray &

# File sync
syncthing-gtk &

# Cut down blue light at night
redshift-gtk &

# Provide a way of using the mouse without moving the mouse
keynav &

# Hide the mouse cursor when not in use
unclutter &

if [[ -x ~/.xsiteinit ]]; then
    ~/.xsiteinit
fi

# Start window manager (must be last line)
exec i3
