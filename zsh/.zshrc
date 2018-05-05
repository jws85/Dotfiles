# ln -s $DROPBOX/Configs/Coding/Zsh/my.zsh $HOME/.zshrc

# Path to your oh-my-zsh installation.
export ZSH=/home/jws/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"
DEFAULT_USER="jws"
# For a simpler theme I like 'ys'

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# - composer: Support for the PHP 'composer' package manager
# - cp: An improved 'copy' command implemented using rsync
# - git: shortcut commands for git
# - z:   switch to directories based on 'frecency'
plugins=(colored-man-pages composer cp git z)

source $ZSH/oh-my-zsh.sh

# User configuration

if [[ -a $HOME/.zsh_local ]]; then
    source $HOME/.zsh_local
fi

# quickly reattach to detached screen
#alias s='screen -S mainscreen -x -R'
alias s="tmux -2 attach"

# Takes two parameters; a value and a max value.
# If value <= 20% of max, return the 256-color code for #0000ff blue.
# If value >= 100% of max, return the 256-color code for #ff0000 red.
# In between, return some mix of the two.
colorize ()
{
    awk -v val=$1 -v max=$2 'BEGIN { nval = val / max; if (nval > 1) printf "196"; else if (nval > 0.8) printf "161"; else if (nval > 0.6) printf "126"; else if (nval > 0.4) printf "91"; else if (nval > 0.2) printf "56"; else printf "21"; }'
}

# Colorize the output of uptime(1); uses the above colorize function
# to do fancy stuff with the load average :P
coloruptime ()
{
    nprocs=$( grep "processor" /proc/cpuinfo | wc -l )
    load1=$( awk '{print $1}' /proc/loadavg )
    load5=$( awk '{print $2}' /proc/loadavg )
    load15=$( awk '{print $3}' /proc/loadavg )
    color1=$( colorize $load1 $nprocs )
    color5=$( colorize $load5 $nprocs )
    color15=$( colorize $load15 $nprocs )
    uptime=$( awk '{up=$1;dayf=up/(24*60*60);dayi=int(dayf);if(dayi>0)printf "%sd ",dayi;hourf=(dayf-dayi)*24;houri=int(hourf);minf=(hourf-houri)*60;printf "%d:%02d",houri,int(minf)}' /proc/uptime )

    printf "\x1b[1;34m%s\x1b[0m / " $( date +%H:%M:%S )
    printf "\x1b[1;34m%s\x1b[0m / " "$uptime"
    printf "\x1b[38;5;%sm%s \x1b[38;5;%sm%s \x1b[38;5;%sm%s\x1b[0m\n\n" $color1 $load1 $color5 $load5 $color15 $load15
}

# Uses coloruptime
fancybanner ()
{
    if [ -x "$(which figlet)" ]; then
        bannerhost=$( cat /etc/hostname | figlet -St -f lean | tr ' _/' ' //' | sed '$d' )
	if [ -x "$(which lolcat)" ]; then
		echo $bannerhost | lolcat
	else
		echo $bannerhost
	fi
    else
        cat /etc/hostname ; echo
    fi

    coloruptime

    if [ -x "$(which fortune)" ]; then
        fortune ; echo
    fi
}

fancybanner

if [ -x "$(which direnv)" ]; then
    eval "$(direnv hook zsh)"
fi
