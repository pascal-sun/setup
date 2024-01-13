#!/bin/sh

GREEN="\033[32m"
ENDCOLOR="\033[0m"

echo "${GREEN}[*] Upgrading...${ENDCOLOR}"
sudo apt-get update && sudo apt-get upgrade -y

echo "${GREEN}[*] Installing pipx...${ENDCOLOR}"
sudo apt-get install -y pipx
pipx ensurepath

echo "${GREEN}[*] Installing Ansible...${ENDCOLOR}"
pipx install --include-deps ansible

echo "${GREEN}[*] Installing Ansible Galaxy Collections${ENDCOLOR}"
ansible-galaxy collection install community.general