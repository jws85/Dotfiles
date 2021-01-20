if type -q composer
    set _path (composer config -g home)/vendor/bin
    contains $_path $fish_user_paths; or set -Ua fish_user_paths $_path
end
