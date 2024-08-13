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

#### Test Ansible Playbook locally

With [`act`](https://nektosact.com/):

```shell
act --env RUNNER_DEBUG=1 --job with-github-runner 
act --env RUNNER_DEBUG=1 --job with-docker-container
```

## TODO

## Architecture decision record

### Python

##### Why not install `python3-pip`?

`pip` is a package installer for Python, and is automatically installed if you're working in a virtual environment.
As `pipx` and `venv` are used, `python3-pip` is not necessary outside a virtual environment,
so install `python3-pip` is not required.

##### Why not install `python3-venv`?

`venv` is integrated into the standard library module since `python3.3`, and is used to create virtual environments.
Therefore, the installation of `python3-venv` is not required normally (need to be checked on Ubuntu).

##### Why not use other package / version / virtual environment managers?

Python has many package and virtual environment managers:

- https://dublog.net/blog/so-many-python-package-managers/
- https://stackoverflow.com/questions/41573587/what-is-the-difference-between-venv-pyvenv-pyenv-virtualenv-virtualenvwrappe

###### Package managers

- **[`pip`](https://pip.pypa.io/)** is the "default" package installer for Python, and specifies package
  dependencies in a `requirements.txt` file
    - :green_circle: Can be a choice for a small-to-medium-sized project, with a small number of dependencies
    - :red_circle: Do not manage dependencies conflicts
    - :red_circle: Do not manage virtual environments (need other tools, such as `virtualenv` or `venv`)
- **[`poetry`](https://python-poetry.org/)** is a newer package manager and specifies package dependencies in
  a `pyproject.toml` file
    - :green_circle: Best choice for a larger and more complex project, with a large number of dependencies
    - :green_circle: Manage virtual environments, from `poetry`'s built-in environment manager, or from external
      environment manager (such as `virtualenv` or `venv`)
    - :green_circle: Resolve dependencies conflicts...
    - :red_circle: ... but slowly
- [`pdm`](https://pdm-project.org/) and [`hatch`](https://hatch.pypa.io/), very similar to `poetry` but less popular, so
  didn't test...
- [`conda`](https://docs.conda.io) and [`mamba`](https://mamba.readthedocs.io/), I'm not a data scientist so...
- [`uv`](https://astral.sh/blog/uv) is no stable for now (but keep an eye on... :eyes:)

###### Version managers

- [`pyenv`](https://github.com/pyenv/pyenv) is used to **switch between multiple versions** of Python, and also install
  multiple Python versions
  ```shell
  # Installation
  curl https://pyenv.run | bash
  # Usage
  pyenv install 3.10
  pyenv global 3.10
  ```

- [`asdf`](https://asdf-vm.com/) is used to manage and **switch multiple language versions** (it's like
  `pyenv`, but for other languages also)
  ```shell
  # Installation
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.0
  # Usage
  asdf plugin add python
  asdf install python 3.10.14 # need to be very specific
  asdf global python 3.10.14
  ```

- **[`mise`](https://mise.jdx.dev/)**, is like `asdf`, but **faster** and **easier to use** (and has additional
  features)
  ```shell
  # Installation
  curl https://mise.run | sh
  # Usage
  mise use --global python@3.10
  ```

:white_check_mark: choose `mise`, which is the best

###### Virtual environment managers

- **[`virtualenv`](https://virtualenv.pypa.io/)** is a popular tool maintained by PyPA, to
  **create virtual environments** for `python2` and `python3`
  ```shell
  # Installation
  pipx install virtualenv
  # Usage
  virtualenv my_env --python=python2.7
  ```
- [`pipenv`](https://pipenv.pypa.io/)


- [`venv`](https://docs.python.org/3/library/venv.html) is a standard library to **create virtual environments** (with
  less feature than `virtualenv`, such as creating virtual environments for arbitrarily installed python versions)
  ```shell
  # Usage
  python3 -m venv my_env
  ```
    - :red_circle: Cannot with different version of Python, and especially `python2`
