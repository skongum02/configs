bindkey -v
export KEYTIMEOUT=1

bindkey "^R" history-incremental-search-backward

# For linux
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

For mac
bindkey "$terminfo[kcuu1]" history-beginning-search-backward
