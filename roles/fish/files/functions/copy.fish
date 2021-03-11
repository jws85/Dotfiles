# Like cp, but with progress bars via rsync
function copy
    # Strip any terminal / slashes because they are syntactically significant
    # to rsync in a way they aren't in cp:
    # http://qdosmsq.dunbar-it.co.uk/blog/2013/02/rsync-to-slash-or-not-to-slash/
    set newargv
    for a in $argv
        set -a newargv (string trim -rc '/' $a)
    end
    printf '%s\n' $newargv

    # Run rsync
    rsync -avh --stats --progress $newargv
end
