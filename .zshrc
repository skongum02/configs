bindkey -v
export KEYTIMEOUT=1

HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
setopt APPEND_HISTORY       # Don't overwrite the file
setopt SHARE_HISTORY        # Share history between different terminal tabs


# 1. Load the required modules
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# 2. Bind the keys (using $terminfo is safer than hardcoded strings)
bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search # Up Arrow
bindkey "${terminfo[kcud1]}" down-line-or-beginnin

bindkey "^R" history-incremental-search-backward

# For linux
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

# For mac
# bindkey "$terminfo[kcuu1]" history-beginning-search-backward
