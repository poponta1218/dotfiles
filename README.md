# dotfiles

My dotfiles managed by [chezmoi](https://www.chezmoi.io/).

- [dotfiles](#dotfiles)
  - [1. Pre-requisites](#1-pre-requisites)
    - [Install pre-requisites](#install-pre-requisites)
  - [2. Apply dotfiles to a new system](#2-apply-dotfiles-to-a-new-system)
  - [3. Update dotfiles](#3-update-dotfiles)

## 1. Pre-requisites

- [git](https://git-scm.com/)
- [chezmoi](https://www.chezmoi.io/docs/install/)

### Install pre-requisites

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- -b ${HOME}/.local/bin
```

## 2. Apply dotfiles to a new system

```bash
chezmoi init --apply poponta1218
# Prompt asks you to enter your git username, email, and PGP signing key.
# When you don't type these, these are set to be empty.
```

## 3. Update dotfiles

```bash
chezmoi update
```
