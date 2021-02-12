# Start up dtach, or attach to existing dtach
function detach
    set file /tmp/dtach
    dtach -A $file fish
end
