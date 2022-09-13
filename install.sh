#!/usr/bin/env bash

# Stop on error
set -e

export cdir="$HOME/nixos"

# Clone this repo
git clone https://github.com/hykilpikonna/nixos-dandelion "$cdir"

# Backup old nixos config
sudo mv /etc/nixos /etc/nixos.bak

# Copy hardware config
sudo cp /etc/nixos.bak/hardware-configuration.nix "$cdir"
sudo chown -R $(id -u):$(id -g) "$cdir"

# Link this nixos config
sudo ln -s "$cdir" /etc/nixos

# Switch to unstable
sudo nix-channel --add https://nixos.org/channels/nixos-unstable nixos

# Rebuild
sudo nixos-rebuild switch --upgrade
