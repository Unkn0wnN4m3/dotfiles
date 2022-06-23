if status --is-login
  set -U fish_greeting
end

if status --is-interactive
  # Custom dircolors
  if test -f $DOTFILES_ZSH/.dir_colors
    eval (dircolors -c $DOTFILES_ZSH/.dir_colors)
  end

  if command -s zoxide > /dev/null
    zoxide init fish | source
  end
end
