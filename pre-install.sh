#!/bin/bash
set -euo pipefail
IFS=$'\n\t'
# http://redsymbol.net/articles/unofficial-bash-strict-mode/

echo "[*] Installing pipx"
sudo apt-get update && sudo apt-get upgrade -y
sudo apt-get install -y pipx
pipx ensurepath

echo "[*] Installing Ansible"
pipx install --include-deps ansible
