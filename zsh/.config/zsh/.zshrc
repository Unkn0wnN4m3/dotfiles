#  _____    _
# |__  /___| |__  _ __ ___
#   / // __| '_ \| '__/ __|
#  / /_\__ \ | | | | | (__
# /____|___/_| |_|_|  \___|
#
# Based on:
# - https://github.com/Phantas0s/.dotfiles
# - https://github.com/ChristianChiarulli/Machfiles
# - https://gitlab.com/dwt1/dotfiles
# - https://github.com/tjdevries/config_manager

# Plugin manager by:
# https://github.com/ChristianChiarulli/Machfiles/blob/master/zsh/.config/zsh/zsh-functions
source $MY_PLUGIN_MANGER/plugin_manager.sh

#GitHub plugins
zsh_add_plugin "lukechilds/zsh-nvm"
zsh_add_plugin "romkatv/powerlevel10k"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Change tittle of terminals
case ${TERM} in
  xterm*|rxvt*|Eterm*|aterm|kterm|gnome*|alacritty|st|konsole*)
    precmd () {
      print -Pn "\e]0;%n@%m: %1~\a"
    } ;;
esac

# Colored file listings
if test -x /usr/bin/dircolors ; then

  # set up the color-ls environment variables:
  if test -f $DOTFILES_ZSH/.dir_colors ; then
      eval "`/usr/bin/dircolors -b $DOTFILES_ZSH/.dir_colors`"
  elif test -f /etc/DIR_COLORS ; then
      eval "`/usr/bin/dircolors -b /etc/DIR_COLORS`"
  fi
fi

# My options
zsh_add_file "setopt.zsh"
zsh_add_file "alias.zsh"
zsh_add_file "scripts.zsh"
zsh_add_file "vi-mode.zsh"
zsh_add_file "completion.zsh"

# Bind keys
bindkey '^f' autosuggest-accept            # ctrl + space

# Use vi mode
bindkey -v
export KEYTIMEOUT=1

# for vi-mode
VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true
VI_MODE_SET_CURSOR=true

# This loads nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

if command -v zoxide > /dev/null 2>&1; then
  eval "$(zoxide init zsh)"
fi

# Custom completion support via /etc/zsh_completion.d
fpath=( $fpath $HOME/.completions )

test -s $HOME/.alias && . $HOME/.alias

# Read custom system-wide config if exists
test -s /etc/zsh.zshrc.local && . /etc/zsh.zshrc.local

test -f /etc/zsh_command_not_found && . /etc/zsh_command_not_found

test -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh && \
  . /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh

test -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh && \
  . /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# To customize prompt, run `p10k configure`
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
