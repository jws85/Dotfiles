# If capslock is stuck with no way to press it, this "presses it" using xdotool
# Sometimes when moving back and forth between keyboard layouts I run into this
function CAPSLOCK
    xdotool key Caps_Lock
end
