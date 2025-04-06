#!/usr/bin/env bash
# vim: set ft=sh:

# Install mise
if [[ ! -e "${HOME}/.local/bin/mise" ]]; then
  echo "Installing mise..."
  curl https://mise.run | MISE_INSTALL_PATH="${HOME}/.local/bin/mise" sh
  echo "mise installed successfully."
fi

if [[ "$(type -P bw)" == "" ]]; then
  echo "Installing Bitwarden CLI..."
  "${HOME}"/.local/bin/mise use --global bitwarden
else
  echo "Bitwarden CLI is already installed."
fi

while ! bw login --check; do
  echo "Logging into Bitwarden..."
  bw login --raw --quiet
done
