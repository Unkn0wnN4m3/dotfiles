# Dotfiles for Zsh and Neovim

## ZSH

My zsh configuration 👌

### Dependencies

Fonts: [nerdfonts.com](https://www.nerdfonts.com/)

#### From GitHub

Automatic installation of the following plugins:

- [Powerlevel10k](https://github.com/romkatv/powerlevel10k) - Powerlevel10k is a theme for Zsh.
- [zsh-history-substring-search](https://github.com/zsh-users/zsh-history-substring-search) - This is a clean-room implementation of the Fish shell's history search feature.
- [zsh-nvm](https://github.com/lukechilds/zsh-nvm) - Zsh plugin for installing, updating and loading nvm.

#### From Debian/Ubuntu

```bash
sudo apt install zsh zsh-syntax-highlighting zsh-autosuggestions fzf tree stow exa
```

Finally, set `ZSH` as your default `$SHELL`.

Using `stow */` inside the repository applies the configuration,
or just `stow zsh` for zsh.

---

## NEOVIM

coming soon...
