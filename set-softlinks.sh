#!/usr/bin/bash

# Colors

CR="\e[0;91m" # Color -> Red
CB="\e[0;94m" # Color -> Blue
CG="\e[0;92m" # Color -> Green
CY="\e[0;33m" # Color -> Yellow
reset="\e[0m"

bkp_path="$HOME/.config/.dotfiles_bkp"
xdg_path="$HOME/.config"
dotfiles_dir="$HOME/.dotfiles"


function check_status() {
  if [ "$1" -eq 0 ];then
    echo -e "${CG}DONE!${reset}"
  else
    echo -e "${CR}ERROR:${reset} $2"
    exit 1
  fi
}

function print_not_installed() {
  bin_array=("$@")
  for bin in "${bin_array[@]}"; do
    n_erros=0
    if ! command -v "$bin" > /dev/null; then
      echo -e " -${CR}'$bin'${reset} is not installed"
      n_erros+=1
    fi
  done
  echo
  return $n_erros
}

function make_missing_dirs() {
  local missing_dir_array=("$@")

  for dir in "${missing_dir_array[@]}"; do
    if [ ! -d "$xdg_path/$dir" ]; then
      echo -e "\n${CY}$dir${reset} does not exists"
      echo -e "${CB}Making '$dir' empty directory here: $xdg_path${reset}"
      mkdir -p "$xdg_path/$dir" 2>/dev/null
      check_status "$?" "Can't make directory"
    fi
  done
}

function start_stow() {
  local stow_array=("$@")
  for dir in "${stow_array[@]}"; do
    echo -n "$dir: "
    stow "$dir" 2>/dev/null
    check_status "$?" "$dir Does not exists in $dotfiles_dir"
  done
}

# Make sure you are not runnign as root

if [ "$UID" -eq 0 ]; then
  echo -e "${CR}You're running as root!${reset}\n"
  exit 1
fi

# Make sure all necesary is installed

dep_bin=( "git" "curl" "wget" "stow" )

print_not_installed "${dep_bin[@]}"

if [ "$n_erros" -ne 0 ]; then
  echo "There are missing packages. Please install everything before continue"
  exit 1
fi

# If you are in $HOME/.dotfiles, you are ready

if [ "$(pwd)" == "$dotfiles_dir" ]; then
  echo -e "\n${CY}[+] Starting...${reset}"; sleep 0.5
else
  echo -e "\n${CR}ERROR: You are not in $dotfiles_dir${reset}"
  exit 1
fi

# Check for dotfiles directories

echo -e "\n${CY}[+] Checking directories...${reset}"; sleep 0.5

xdg_dirs=( "nvim" "zsh" "bat" "kitty" "fish" )

make_missing_dirs "${xdg_dirs[@]}"

# Making soft links whith stow
start_stow "${xdg_dirs[@]}"

echo -e "\n${CG}** All set up! Enjoy :) **${reset}"
