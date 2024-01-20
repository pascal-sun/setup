# setup

[![🚀 Integration](https://github.com/pascal-sun/setup/actions/workflows/run-ansible.yml/badge.svg)](https://github.com/pascal-sun/setup/actions/workflows/run-ansible.yml)
[![✨ Lint](https://github.com/pascal-sun/setup/actions/workflows/lint.yml/badge.svg)](https://github.com/pascal-sun/setup/actions/workflows/lint.yml)

Ansible Playbook to setup my workstation

## How to run it?

On a freshly installed **Ubuntu 22.04 LTS** (_Jammy Jellyfish_):

#### Update your packages
```shell
sudo apt update && sudo apt upgrade -y
```

#### Install `git` and clone the repository
```shell
sudo apt install -y git
git clone https://github.com/pascal-sun/setup.git
cd setup/
```

#### Install Ansible with `pipx`
```shell
sudo apt install -y pipx
pipx ensurepath
pipx install ansible-core
```

#### Install required Ansible Galaxy Collections
```shell
ansible-galaxy install -r requirements.yml
```

#### Run Ansible Playbook
```shell
ansible-playbook playbook.yml --ask-become-pass 
```
```shell
BECOME password: <Enter your password>
```

And that's it! :rocket:


### TODO

- eza