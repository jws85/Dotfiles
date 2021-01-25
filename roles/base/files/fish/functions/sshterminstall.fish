# Install current $TERM on given host
# To make your life easier, do ssh-copy-id first...
function sshterminstall
    pushd .
    cd /usr/share/terminfo
    ssh $argv[1] 'mkdir -p ~/.terminfo'
    find . -type f -name $TERM\* -print0 | rsync -av --files-from=- --from0 . $argv[1]:~/.terminfo
    popd
end
