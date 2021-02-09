# Install current $TERM on given host
# Copied from https://unix.stackexchange.com/a/619965
#
# I need this because every 'reasonable' terminal as of late has gotten
# into the habit of using their own bespoke $TERM values, thus making
# remote vim (or, on some boxes, remote bash!) a crapshoot
#
# Note that you will need infocmp locally, and tic remotely.  infocmp is
# installed 'by default' on my Ubuntu box, and tic seems to be available
# on both new and old Linux boxen I come across.
#
# The terminfo files are compiled, so it isn't as easy as copying them
# around as an older box or different arch might do things differently.
#
# To make your life easier, do ssh-copy-id first...
function sshterminstall
    infocmp -x | ssh -t $argv[1] 'cat > "$TERM.info" && tic -x "$TERM.info"'
end
