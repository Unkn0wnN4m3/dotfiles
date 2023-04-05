if status --is-login
    set -U fish_greeting

    set -gx VIRTUAL_ENV_DISABLE_PROMPT 1

    # Terminal
    # set -gx TERM xterm-256color
    set -gx DOTFILES $HOME/.dotfiles
    set -gx DOTFILES_ZSH $DOTFILES/zsh/.config/zsh
    set -gx DOTFILES_NVIM $DOTFILES/nvim/.config/nvim

    # Setting my favorite text editor
    set -gx EDITOR nvim
    set -gx VISUAL nvim

    # User Private binaries
    fish_add_path -a $HOME/.config/local/bin
    fish_add_path -a $HOME/.local/bin

    # Other
    set -gx GPG_TTY (tty)
end

if status --is-interactive
    # Custom dircolors
    if test -f $DOTFILES_ZSH/.dir_colors
        eval (dircolors -c $DOTFILES_ZSH/.dir_colors)
    end

    if test -d /home/linuxbrew/.linuxbrew/bin
        /home/linuxbrew/.linuxbrew/bin/brew shellenv | source
    end

    if test -d (brew --prefix)"/share/fish/completions"
        set -gx fish_complete_path $fish_complete_path (brew --prefix)/share/fish/completions
    end

    if test -d (brew --prefix)"/share/fish/vendor_completions.d"
        set -gx fish_complete_path $fish_complete_path (brew --prefix)/share/fish/vendor_completions.d
    end

    if command -s zoxide >/dev/null
        zoxide init fish | source
    end

    if command -s starship >/dev/null
        starship init fish | source
    end
end
