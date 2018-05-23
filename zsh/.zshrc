export TERM=xterm-256color

source $HOME/.zsh/antigen.zsh

antigen use oh-my-zsh

antigen bundle colored-man-pages
antigen bundle composer
antigen bundle cp
antigen bundle git
antigen bundle tmux
antigen bundle z

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions

antigen theme refined

antigen apply

if [[ -a $HOME/.zsh_local ]]; then
    source $HOME/.zsh_local
fi

source $HOME/.zsh/welcome.zsh
