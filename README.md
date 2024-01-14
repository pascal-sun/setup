# setup

[![🚀 Run Ansible Playbook](https://github.com/pascal-sun/setup/actions/workflows/run-ansible.yml/badge.svg)](https://github.com/pascal-sun/setup/actions/workflows/run-ansible.yml)
[![✨ Lint Ansible Playbook](https://github.com/pascal-sun/setup/actions/workflows/lint-ansible.yml/badge.svg)](https://github.com/pascal-sun/setup/actions/workflows/lint-ansible.yml)

Ansible Playbook to setup my workstation

### How to run it?

```shell
sudo apt install git
git clone https://github.com/pascal-sun/setup.git
cd setup
./pre-install.sh
ansible-playbook playbook.yml --ask-become-pass 
```

### Todo
- [x] PyCharm, ~~Toolbox~~
- [x] ~~Firefox~~ (already installed in Ubuntu 22.04), Chrome
- [x] mise (python, golang)
- [ ] Burp Suite
- [x] Slack
- [ ] exegol
- [x] docker
- [x] Signal
- [x] Flameshot
- [ ] Wireshark
- [x] Spotify
- [x] Obsidian