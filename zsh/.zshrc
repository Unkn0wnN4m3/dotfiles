# PATH fix the duplicates
typeset -U path

# Hist
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups hist_ignore_space share_history hist_reduce_blanks

# General options
setopt autocd extendedglob
bindkey -v
KEYTIMEOUT=1

# Autocomplete
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

eval "$(aliae init zsh)"
