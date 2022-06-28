# Terminal
set -gx DOTFILES $HOME/.dotfiles
set -gx DOTFILES_ZSH $DOTFILES/zsh/.config/zsh
set -gx DOTFILES_NVIM $DOTFILES/nvim/.config/nvim

# XDG base dirextory
set -gx XDG_CONFIG_HOME $HOME/.config
#set -gx XDG_DATA_HOME $XDG_CONFIG_HOME/local/share
#set -gx XDG_CACHE_HOME $XDG_CONFIG_HOME/cache

# Setting my favorite text editor
set -gx EDITOR nvim
set -gx VISUAL nvim

# User Private binaries
if test -d $HOME/.config/local/bin
  fish_add_path $HOME/.config/local/bin
end

if test -d $HOME/.local/bin
  fish_add_path $HOME/.local/bin
end

# Cargo bin
if test -d $HOME/.cargo/bin
  fish_add_path $HOME/.cargo/bin
end

# Go
if test -d /usr/local/go/bin
  set -gx GOPATH $HOME/go
  set -gx GOBIN $GOPATH/bin
  fish_add_path /usr/local/go/bin/ $GOBIN
end

# Other
set -gx GPG_TTY (tty)

set -gx FZF_DEFAULT_OPTS '--height 50% --layout=reverse
--color fg:-1,bg:-1,hl:33,fg+:254,bg+:235,hl+:33
--color info:136,prompt:136,pointer:230,marker:230,spinner:136'
set -gx FZF_DEFAULT_COMMAND 'fd --type f --hidden --follow --exclude .git'

# Man-pages
# Start blinking
set -gx LESS_TERMCAP_mb (tput setaf 6) # cyan
# Start bold
set -gx LESS_TERMCAP_md (tput setaf 6) # cyan
# Start stand out
set -gx LESS_TERMCAP_so (tput setaf 3) # yellow
# End standout
set -gx LESS_TERMCAP_se (tput rmso; tput sgr0)
# Start underline
set -gx LESS_TERMCAP_us (tput smul; tput bold; tput setaf 1) # red
# End Underline
set -gx LESS_TERMCAP_ue (tput sgr0)
# End bold, blinking, standout, underline
set -gx LESS_TERMCAP_me (tput sgr0)
