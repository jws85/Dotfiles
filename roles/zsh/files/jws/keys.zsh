# Integrate vi bindings with emacs control keys
# On the command line, I like to have emacs bindings generally,
# but find it handy to use vicmd to do heavier edits.
bindkey -v
bindkey "^A" beginning-of-line
bindkey "^B" backward-char
bindkey "^E" end-of-line
bindkey "^F" forward-char
bindkey "^D" delete-char
bindkey "^K" kill-line
bindkey "^L" clear-screen
bindkey "^R" history-incremental-search-backward
bindkey "^U" kill-whole-line
bindkey "^W" backward-kill-word
bindkey "^Y" yank

