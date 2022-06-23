# ALIAS

# ls
alias ls="ls --group-directories-first"

if command -v exa > /dev/null 2>&1; then
  alias lsa="exa -lagF --icons --group-directories-first"
  alias ll="exa -lgF --icons --group-directories-first"
  alias la="exa -aF --icons --group-directories-first"
else
  alias ll="/bin/ls -lhF --color=auto --group-directories-first"
  alias la="/bin/ls -AF --color=auto --group-directories-first"
  alias lsa="/bin/ls -lhAF --color=auto --group-directories-first"
fi

# Grep
alias grep="grep --color=auto"
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"

# Files
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -i'

# Nvim
alias n="nvim"
alias nvimn='nvim --noplugin -u NONE' # launch nvim without any plugin or config

# Apt
alias aupdate="sudo apt update"
alias ainstall="sudo apt install"
alias asearch="apt search"
alias aremove="sudo apt autoremove"
alias ac_search="apt-cache search"
alias ac_show="apt-cache show"

# Other
alias tree="tree -C --sort=name"

# Git
alias gs='git status'
alias ga='git add'
alias gp='git push'
alias gpo='git push origin'
alias gplo='git pull origin'
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
alias gco='git checkout '
alias gr='git remote'
alias glol='git log --graph --oneline --decorate'

# Programming languages
alias py="python3"
alias ja="java"
alias jac="javac"

# bw generate passwords
alias bw-genp="bw generate --passphrase --words 6 --separator -"
alias bw-genw="bw generate -ulns --length 50"

# sumeko-lua
alias luamake="/home/julio/Downloads/lua-language-server/3rd/luamake/luamake"
