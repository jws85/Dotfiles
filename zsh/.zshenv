# ln -s $DROPBOX/Configs/Coding/Zsh/myenv.zsh $HOME/.zshenv

# I plan to deprecate this eventually, in favor of ~/.local/bin
export PATH=$HOME/bin:$PATH

# Compile/install programs inside your home directory
# http://nullprogram.com/blog/2017/06/19/ 
export BUILD_PREFIX=$HOME/.local
export PATH=$BUILD_PREFIX/bin:$PATH
export C_INCLUDE_PATH=$BUILD_PREFIX/include
export CPLUSPLUS_INCLUDE_PATH=$BUILD_PREFIX/include
export LIBRARY_PATH=$BUILD_PREFIX/lib
export LD_LIBRARY_PATH=$BUILD_PREFIX/lib
export PKG_CONFIG_PATH=$BUILD_PREFIX/lib/pkgconfig
unset MANPATH
export MANPATH=$BUILD_PREFIX/share/man:$(manpath)

# Fix aptitude line-drawing chars in PuTTY: https://superuser.com/a/278337
export NCURSES_NO_UTF8_ACS=1

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# Go
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/Projects/Go
