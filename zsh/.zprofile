# always use venv
export PIP_REQUIRE_VIRTUALENV=true

# Use ** as the trigger sequence
export FZF_COMPLETION_TRIGGER='**'

# Options to fzf command
export FZF_COMPLETION_OPTS='--height 50% --layout=reverse'

# bat theme
export BAT_THEME="base16"

# Other Software
export GPG_TTY="$(tty)"

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
  PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
  PATH="$HOME/.local/bin:$PATH"
fi

