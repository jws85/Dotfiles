nodepath=$HOME/.npm-packages

export PATH=$nodepath/bin:$PATH
export NODE_PATH=$nodepath/lib/node_modules

if [[ ! -v MANPATH ]]; then
    export MANPATH=$( manpath -g )
fi
export MANPATH=$nodepath/share/man:$MANPATH
