# Great name by accident btw
contains /usr/local/go/bin $fish_user_paths; or set -Ua fish_user_paths /usr/local/go/bin
set -x GOPATH ~/.config/go
contains "$GOPATH/bin" $fish_user_paths; or set -Ua fish_user_paths "$GOPATH/bin"
