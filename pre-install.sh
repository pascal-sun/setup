#!/bin/sh

GREEN="\033[32m"
ENDCOLOR="\033[0m"

echo -e "${GREEN}[*] Upgrading...${ENDCOLOR}"
sudo apt-get update && sudo apt-get upgrade -y

echo -e "${GREEN}[*] Installing pipx...${ENDCOLOR}"
sudo apt-get install -y pipx
pipx ensurepath

echo -e "${GREEN}[*] Installing Ansible...${ENDCOLOR}"
pipx install --include-deps ansible
