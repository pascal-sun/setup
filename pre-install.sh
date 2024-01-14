#!/bin/sh

GREEN="\033[32m"
ENDCOLOR="\033[0m"

echo "${GREEN}[*] Upgrading...${ENDCOLOR}"
sudo apt-get update

echo "${GREEN}[*] Installing pipx...${ENDCOLOR}"
sudo apt-get install -y pipx
pipx ensurepath

echo "${GREEN}[*] Installing Ansible...${ENDCOLOR}"
pipx install ansible-core

echo "${GREEN}[*] Installing Ansible Galaxy Collections${ENDCOLOR}"
ansible-galaxy install -r requirements.yml