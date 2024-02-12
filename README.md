# dotfiles

My dotfiles managed by [chezmoi](https://www.chezmoi.io/).

- [dotfiles](#dotfiles)
  - [1. Pre-requisites](#1-pre-requisites)
  - [2. Apply dotfiles to a new system](#2-apply-dotfiles-to-a-new-system)
  - [3. Update dotfiles](#3-update-dotfiles)

## 1. Pre-requisites

- [git](https://git-scm.com/)

## 2. Apply dotfiles to a new system

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- -b ${HOME}/.local/bin init --apply poponta1218 && \
rm -rf ${HOME}/.local/bin/chezmoi
```

Prompt asks you to enter your git username, email, and PGP signing key.  
When you don't type these, these are set to be empty.

## 3. Update dotfiles

```bash
chezmoi update
```
