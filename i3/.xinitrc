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

if [[ -x ~/.xsiteinit ]]; then
    ~/.xsiteinit
fi

# Start window manager (must be last line)
exec i3
