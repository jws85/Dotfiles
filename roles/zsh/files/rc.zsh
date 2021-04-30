# History
HISTFILE=~/.zhistory
HISTSIZE=100000
SAVEHIST=$HISTSIZE

# Settings
setopt autocd extendedglob
unsetopt beep nomatch notify

source $HOME/.zsh/jws/keys.zsh
source $HOME/.zsh/jws/lscolors.zsh
source $HOME/.zsh/jws/autocomp.zsh
source $HOME/.zsh/jws/aliases.zsh

# Prompt: https://starship.rs
eval "$(starship init zsh)"

# Completion: fzf (via Ubuntu package)
source /usr/share/doc/fzf/examples/key-bindings.zsh
source /usr/share/doc/fzf/examples/completion.zsh

# https://github.com/zsh-users/zsh-syntax-highlighting
source $HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# https://github.com/zsh-users/zsh-history-substring-search
source $HOME/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh
bindkey '^[[A' history-substring-search-up
bindkey -M emacs '^P' history-substring-search-up
bindkey -M viins '^P' history-substring-search-up
bindkey -M vicmd 'k' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M emacs '^N' history-substring-search-down
bindkey -M viins '^N' history-substring-search-down
bindkey -M vicmd 'j' history-substring-search-down

# https://github.com/knu/zsh-manydots-magic
source $HOME/.zsh/zsh-manydots-magic/manydots-magic
manydots-magic

# Welcome message
source $HOME/.zsh/jws/welcome.zsh

# Local configuration
if [ -e $HOME/.zshrc.local ]; then
    source $HOME/.zshrc.local
fi
