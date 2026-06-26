#!/bin/bash

echo "Deploying system NixOS configuration..."
sudo nixos-rebuild switch --flake ./nix#frete

echo "Deploying user dotfiles..."
stow -R --no-folding bash mc nvim wezterm niri tmux wayland-tools
