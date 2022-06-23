###############################
# EXPORT ENVIRONMENT VARIABLE #
###############################

# Terminal
# export TERM="xterm-256color" # Enable term 256 color
export DOTFILES="$HOME/.dotfiles"
export DOTFILES_ZSH="$DOTFILES/zsh/.config/zsh"
export DOTFILES_NVIM="$DOTFILES/nvim/.config/nvim"

# XDG base directoty
export XDG_CONFIG_HOME="$HOME/.config"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
# export XDG_DATA_HOME="$XDG_CONFIG_HOME/local/share"
# export XDG_CACHE_HOME="$XDG_CONFIG_HOME/cache"

# Setting my favorite text editor
export EDITOR="nvim"
export VISUAL="nvim"

# Zsh environment variables
export HISTFILE="$ZDOTDIR/.zhistory" # History filepath
export HISTSIZE=10000                            # Maximum events for internal history
export SAVEHIST=10000                            # Maximum events in history file

# fzf
# Use ** as the trigger sequence
export FZF_COMPLETION_TRIGGER='**'
# Options to fzf command
export FZF_COMPLETION_OPTS='--height 50% --layout=reverse
--color fg:-1,bg:-1,hl:33,fg+:254,bg+:235,hl+:33
--color info:136,prompt:136,pointer:230,marker:230,spinner:136'
# Setting fd as the default source for fzf
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.config/local/bin" ] ; then
  PATH="$HOME/.config/local/bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ; then
  PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/.cargo/bin" ]; then
  PATH="$HOME/.cargo/bin:$PATH"
fi

# Go
if [ -d /usr/local/go/bin/ ]; then
  export GOPATH=~/go
  export GOBIN="$GOPATH/bin"
  export PATH="/usr/local/go/bin:$GOBIN:$PATH"
elif [ -d ~/.go/bin/ ]; then
  export GOPATH="$HOME/.gopath"
  export GOROOT="$HOME/.go"
  export GOBIN="$GOPATH/bin"
  export PATH="$GOPATH/bin:$PATH"
fi

# Other Software
export GPG_TTY="$(tty)"
export NVM_DIR="$HOME/.config/nvm"

# less and man
# Start blinking
export LESS_TERMCAP_mb=$(tput setaf 6) # cyan
# Start bold
export LESS_TERMCAP_md=$(tput setaf 6) # cyan
# Start stand out
export LESS_TERMCAP_so=$(tput setaf 3) # yellow
# End standout
export LESS_TERMCAP_se=$(tput rmso; tput sgr0)
# Start underline
export LESS_TERMCAP_us=$(tput smul; tput bold; tput setaf 1) # red
# End Underline
export LESS_TERMCAP_ue=$(tput sgr0)
# End bold, blinking, standout, underline
export LESS_TERMCAP_me=$(tput sgr0)

# Cuztom files
export MY_PLUGIN_MANGER="$DOTFILES_ZSH/options"
