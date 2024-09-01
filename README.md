# setup

[![🚀 Integration](https://github.com/pascal-sun/setup/actions/workflows/run-ansible.yml/badge.svg)](https://github.com/pascal-sun/setup/actions/workflows/run-ansible.yml)
[![✨ Lint](https://github.com/pascal-sun/setup/actions/workflows/lint.yml/badge.svg)](https://github.com/pascal-sun/setup/actions/workflows/lint.yml)

Ansible Playbook to setup my workstation

## How to run it?

On a freshly installed **Ubuntu 24.04 LTS** (_Noble Numbat_):

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
sudo apt install -y python3-pip python3-venv
pip install pipx
pipx ensurepath
pipx install ansible-core
```

> [!NOTE]  
> `pipx` installation with `apt` is only available to Ubuntu 23.04 or above.
> For now, install it with `pip`

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

## How to test it?

#### With [`act`](https://nektosact.com/)

```shell
act --env RUNNER_DEBUG=1 --job with-github-runner 
act --env RUNNER_DEBUG=1 --job with-docker-container
```

## Architecture decision record

<details>
<summary>Docker</summary>

#### Docker Engine or Docker Desktop?

On Linux, you have the choice between **Docker Engine** and **Docker Desktop** _(which isn't the case for macOS and
Windows: Docker Desktop is the only choice, as a VM on Linux is mandatory)._

:green_circle: [**Docker Engine**](https://docs.docker.com/engine/) is the core software that enables containerization,
which includes the Docker daemon `dockerd`, the command-line interface `docker` and APIs to talk to the Docker daemon.
It's **free**, **easier to install** with the Docker repository, and it's **less consuming** in terms of resources, as
it includes only essential components and runs directly on the operating system.

:red_circle: [**Docker Desktop**](https://docs.docker.com/desktop/) is a package of tools, which includes
**Docker Engine**, **Docker Extensions**, **Docker Compose**, **Kubernetes**, etc. _(stuff that I don't need)_ and a
graphical interface. Due to the additional components and the use of a Virtual Machine
([even on Linux](https://docs.docker.com/desktop/faqs/linuxfaqs/#why-does-docker-desktop-for-linux-run-a-vm)), it can be
**more consuming** in terms of resources than Docker Engine alone.

_The Docker Engine and the CLI are enough for my use, and if not, can use the Docker interface of Jetbrains IDEs instead
of the Docker Desktop._

</details>

<details>
<summary>Python</summary>

#### Why not install `python3-pip`?

`pip` is a package installer for Python, and is automatically installed if you're working in a virtual environment.
As `pipx` and `venv` are used, `python3-pip` is not necessary outside a virtual environment,
so install `python3-pip` is not required.

#### Why install `python3-venv`?

`venv` is integrated into the standard library module since `python3.3`, and is used to create virtual environments.
The installation of `python3-venv` is done by default when Python is installed.

However, on Debian/Ubuntu (and derivatives), `python3-venv` is not installed by default: you must install manually, to
use tool like `pipx` (https://pipx.pypa.io/stable/troubleshooting/#debian-ubuntu-issues.

#### Why not use other package / version / virtual environment managers?

Python has many package and virtual environment managers:

- https://dublog.net/blog/so-many-python-package-managers/
- https://stackoverflow.com/questions/41573587/what-is-the-difference-between-venv-pyvenv-pyenv-virtualenv-virtualenvwrappe

###### Package managers

:green_circle: [**pip**](https://pip.pypa.io/) is the "default" package installer for Python, and specifies package
dependencies in a `requirements.txt` file.
Ideal for a small to medium project, with a small number of dependencies.
However, it does not manage dependency conflicts and virtual environments (need other tools, such as `virtualenv`
or `venv`)

:green_circle: [**poetry**](https://python-poetry.org/) is a newer popular package manager and specifies package
dependencies in a `pyproject.toml` file.
Best choice for a larger and more complex project, with a large number of dependencies.
It manages virtual environments, from its built-in environment manager, or from external environment manager
(such as `virtualenv` or `venv`).
And it resolves dependency conflicts... but slowly.

:red_circle: [**pdm**](https://pdm-project.org/) and [**hatch**](https://hatch.pypa.io/), very similar to `poetry` but
less
popular, so didn't test...

:red_circle: [**conda**](https://docs.conda.io) and [**mamba**](https://mamba.readthedocs.io/), I'm not a data scientist
so...

:yellow_circle: [**uv**](https://astral.sh/blog/uv) is an extremely fast Python package installer and resolver,
written in Rust, and designed as a drop-in replacement for pip.
But it is no stable for now (but keep an eye on... :eyes:)

###### Version managers

- [`pyenv`](https://github.com/pyenv/pyenv) is used to **switch between multiple versions** of Python, and also install
  multiple Python versions
  ```shell
  # Installation
  curl https://pyenv.run | bash
  # Usage
  pyenv install 3.10
  pyenv local 3.10
  ```

- [`asdf`](https://asdf-vm.com/) is used to manage and **switch multiple language versions** (it's like
  `pyenv`, but for other languages also)
  ```shell
  # Installation
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.0
  # Usage
  asdf plugin add python
  asdf install python 3.10.14 # need to be very specific
  asdf local python 3.10.14
  ```

- :white_check_mark: [`mise`](https://mise.jdx.dev/), is like `asdf`, but **faster** and **easier to use** (and has
  additional features)
  ```shell
  # Installation
  curl https://mise.run | sh
  # Usage
  mise use python@3.10
  ```

###### Virtual environment managers

- **[`virtualenv`](https://virtualenv.pypa.io/)** is a popular tool maintained by PyPA, to
  **create virtual environments** for `python2` and `python3`
  ```shell
  # Installation
  pipx install virtualenv
  # Usage
  virtualenv my_env --python=python2.7
  ```

- [`pipenv`](https://pipenv.pypa.io/) is a mixture with `pip` and `virtualenv`

- [`venv`](https://docs.python.org/3/library/venv.html) is a standard library to **create virtual environments** (with
  less feature than `virtualenv`, such as creating virtual environments for arbitrarily installed python versions)
  ```shell
  # Usage
  python3 -m venv my_env
  ```
    - :red_circle: Cannot with different version of Python, and especially `python2`

</details>

## TODO

- [ ] Switch to Ubuntu 24.04
    - [ ] Wait for Regolith
    - [ ] Wait for GitHub Action runner
- [ ] bottom or htop?
- [ ] autoclean, autoremove, purge, etc. on apt packages?
- [ ] onlyoffice, libreoffice, freeoffice, wps office, openoffice, calligra office, gnome office, .etc
- [ ] Google Chrome
- [ ] JetBrains Fleet
- [ ] mise plugins:
    - [ ] act
    - [ ] bat
    - [ ] bat-extract
    - [ ] bottom
- [ ] Generate SSH key
- [ ] Starship? Or Pure?