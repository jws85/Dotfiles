# Like cp, but with progress bars
function copy
    rsync -avh --progress $argv
end
