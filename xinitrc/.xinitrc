#!/bin/bash

# Set wallpaper
feh --bg-scale $HOME/.wallpaper

# Compositor
compton -b

# Notifications
dunst &

# Swap Caps Lock and Control; set Right Alt to Compose
setxkbmap -option ctrl:swapcaps,compose:ralt

# Cut down blue light at night
redshift-gtk &

# Music server
if ! $( ps aux | egrep '[m]pd$' | grep -v defunct ); then
    mpd
fi
#if ! $( ps aux | egrep '[m]pd-notification' | grep -v defunct ); then
#    mpd-notification &
#fi

# Dropbox
caja-dropbox start &

# Start the Emacs daemon if it hasn't been already
if ! $( ps aux | egrep '[e]macs' | grep -v defunct ); then
    emacs --daemon &
fi

if [[ -x ~/.xsiteinit ]]; then
    ~/.xsiteinit
fi

# Start StumpWM
exec sbcl --load $HOME/.stumpwm.d/kickstart.lisp
