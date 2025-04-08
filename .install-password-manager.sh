#!/usr/bin/env bash
# vim: set ft=sh:

if [[ "$(type -P bw)" == "" ]]; then
  case "$(uname -s)" in
  Linux)
    if [[ "$(type -P wget)" != "" ]]; then
      echo "Installing Bitwarden CLI via wget..."
      wget -O /tmp/bw.zip "https://vault.bitwarden.com/download/?app=cli&platform=linux"
    elif [[ "$(type -P curl)" != "" ]]; then
      echo "Installing Bitwarden CLI via curl..."
      curl -fsSL "https://vault.bitwarden.com/download/?app=cli&platform=linux" --output /tmp/bw.tar.gz
    else
      echo "Neither wget nor curl is available. Please install one of them to proceed."
      exit 1
    fi
    mkdir -p "${HOME}/.local/bin"
    unzip -o /tmp/bw.zip -d "${HOME}/.local/bin"
    chmod +x "${HOME}/.local/bin/bw"
    rm /tmp/bw.zip
    ;;
  *)
    echo "Unsupported OS. Please install Bitwarden CLI manually."
    exit 1
    ;;
  esac
else
  echo "Bitwarden CLI is already installed."
fi

if [[ "$(type -P bw)" != "" ]]; then
  while ! bw login --check; do
    echo "Logging into Bitwarden..."
    bw login --raw --quiet
  done
fi
