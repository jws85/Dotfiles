type composer > /dev/null 2>&1

if [ $? -eq 0 ]; then
    export PATH=$( composer config -g home )/vendor/bin:$PATH
fi
