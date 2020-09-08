if (( $+commands[composer] )) ; then
    export PATH=$( composer config -g home )/vendor/bin:$PATH
fi
