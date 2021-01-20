set _path ~/.npm-packages

contains $_path/bin $fish_user_paths; or set -Ua fish_user_paths $_path/bin

set -q MANPATH || set MANPATH ''
set -x MANPATH $MANPATH $_path/share/man

set -x NODE_PATH $NODE_PATH $_path/lib/node_modules
