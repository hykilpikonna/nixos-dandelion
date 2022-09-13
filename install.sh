#!/usr/bin/env bash

# Stop on error
set -e

# Check root user
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

# Clone this repo to /nixcfg
git clone git@github.com:hykilpikonna/nixos-dandelion.git /nixc

# Backup old nixos config
mv /etc/nixos /etc/nixos.bak

# Link this nixos config
ln -s /nixc /etc/nixos

# Switch to unstable
nix-channel --add https://nixos.org/channels/nixos-unstable nixos

# Rebuild
nixos-rebuild switch --upgrade
