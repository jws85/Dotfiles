# History
HISTFILE=~/.zhistory
HISTSIZE=100000
SAVEHIST=$HISTSIZE

# Settings
setopt autocd extendedglob
unsetopt beep nomatch notify

# Integrate vi bindings with some emacs flavor control keys.
bindkey -v
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line
bindkey "^K" kill-line
bindkey "^L" clear-screen
bindkey "^R" history-incremental-search-backward
bindkey "^U" kill-whole-line
bindkey "^W" backward-kill-word
bindkey "^Y" yank

# Autocompletion
zstyle :compinstall filename '/home/jws/.zshrc'
autoload -Uz compinit
typeset -i updated_at=$(date +'%j' -r ~/.zcompdump 2>/dev/null || stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)
if [ $(date +'%j') != $updated_at ]; then
  compinit -i
else
  compinit -C -i
fi

# Enable ls colors
export LSCOLORS="Gxfxcxdxbxegedabagacad"
if [[ -z "$LS_COLORS" ]]; then
  (( $+commands[dircolors] )) && eval "$(dircolors -b)"
fi
ls --color -d . &>/dev/null && alias ls='ls --color=tty' || { ls -G . &>/dev/null && alias ls='ls -G' }

# Improve autocompletion style
zstyle ':completion:*' menu select # select completions with arrow keys
zstyle ':completion:*' group-name '' # group results by category
zstyle ':completion:::::' completer _expand _complete _ignored _approximate # enable approximate matches for completion

# Use ls-colors for path completions
zstyle ':completion:*' list-colors "${(@s.:.)LS_COLORS}"

# Aliases
alias open=mimeopen
if type exa > /dev/null; then
  alias ll='exa -l --git'
else
  alias ll='ls -hal'
fi

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
hostname | figlet -f smslant | lolcat
uptime | xargs
echo
fortune
