#!/usr/bin/env bash
# vim: set ft=sh:

if [[ "$(type -P bw)" == "" ]]; then
  case "$(uname --kernel-name)" in
  Linux)
    host="$(uname --nodename)"
    if [[ "${host}" == "tako*" && "${host##tako}" -le "61" ]]; then
      download_url="https://github.com/bitwarden/clients/releases/download/cli-v2023.1.0/bw-linux-2023.1.0.zip"
    else
      download_url="https://vault.bitwarden.com/download/?app=cli&platform=linux"
    fi

    if [[ "$(type -P wget)" != "" ]]; then
      echo "Installing Bitwarden CLI via wget..."
      wget --output-document /tmp/bw.zip "${download_url}" --quiet
    elif [[ "$(type -P curl)" != "" ]]; then
      echo "Installing Bitwarden CLI via curl..."
      curl --output /tmp/bw.zip --fail --silent --show-error --location "${download_url}"
    else
      echo "Neither wget nor curl is available. Please install one of them to proceed."
      exit 1
    fi
    mkdir --parents "${HOME}/.local/bin"
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
