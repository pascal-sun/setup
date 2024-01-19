# setup

[![🚀 Integration](https://github.com/pascal-sun/setup/actions/workflows/run-ansible.yml/badge.svg)](https://github.com/pascal-sun/setup/actions/workflows/run-ansible.yml)
[![✨ Lint](https://github.com/pascal-sun/setup/actions/workflows/lint.yml/badge.svg)](https://github.com/pascal-sun/setup/actions/workflows/lint.yml)

Ansible Playbook to setup my workstation

### How to run it?

On a freshly installed Ubuntu 22.04 LTS (Jammy Jellyfish):
```shell
sudo apt install git
git clone https://github.com/pascal-sun/setup.git
cd setup
./pre-install.sh
ansible-playbook playbook.yml --ask-become-pass 
```

### Todo
- [ ] Burp Suite