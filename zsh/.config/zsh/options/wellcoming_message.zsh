#!/bin/zsh

# WELLCOMING MESSAGE

# Colors
CR="\e[0;91m" # Color -> Red
CB="\e[0;94m" # Color -> Blue
CG="\e[0;92m" # Color -> Green
CY="\e[0;33m" # Color -> Yellow
CM="\e[0;35m" # Color -> Magent/purple
reset="\e[0m"

# User wellcoming message
USER_MESSAGE="\
${CY}       _______________         ___
${CY}      /              /        /  /
${CG}     /_______     __/        /  /__
${CG}            /    /          /  /__/
${CB}   _____   /    /___    ___/  /____________
${CB}  /   _/  /    /   /   /  /  /   /  ___   /            BIENVENIDO
${CM} /   /__ /    /   /___/  /  /   /  /__/  /
${CM}/____________/__________/__/___/________/              Cargando instancias...${reset}\n"

# Root wellcoming message
ROOT_MESSAGE="\n${CY}...Running as ROOT ${CR}¡Cuidado!${reset}\n"

if [[ $UID != 0 && $USERNAME == "julio" ]]; then
    echo -e "$USER_MESSAGE"
elif [[ $UID == 0 ]]; then
    echo -e "$ROOT_MESSAGE"
fi
