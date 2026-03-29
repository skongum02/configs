bindkey -v
export KEYTIMEOUT=1

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

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

# 1. Standard Zsh setup
autoload -U colors && colors
setopt PROMPT_SUBST

# 2. Manual Git Info
git_prompt_info() {
  local ref=$(git symbolic-ref --short HEAD 2>/dev/null)
  if [[ -n "$ref" ]]; then
    local dirty=""
    # Fixed the flag to --porcelain (standard for scripts)
    [[ -n $(git status --porcelain -uno 2>/dev/null) ]] && dirty="%{$fg[yellow]%}✗"
    
    echo "%{$fg_bold[blue]%}git:(%{$fg[red]%}${ref}%{$fg[blue]%})${dirty}%{$reset_color%} "
  fi
}

# 3. Your Corrected Prompt
PROMPT='%(?.%{$fg_bold[green]%}➜ .%{$fg_bold[red]%}➜ ) %{$fg[cyan]%}%d%{$reset_color%} $(git_prompt_info)
λ '

RPROMPT='[%*]'
