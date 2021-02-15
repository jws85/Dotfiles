# Get the weather with wttr.in
function wttr
    if test (count $argv) -ne 1
        echo "Please only give one argument: a placename"
        return 1
    end

    curl "wttr.in/$argv[1]"
end
