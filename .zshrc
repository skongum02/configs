bindkey -v
export KEYTIMEOUT=1

# For linux
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

For mac
bindkey "$terminfo[kcuu1]" history-beginning-search-backward
