#!/bin/bash

echo "Deploying system NixOS configuration..."
sudo stow -R --no-folding -t / nixos

echo "Deploying user dotfiles..."
stow -R --no-folding bash mc nix-modules nvim wezterm niri tmux waybar
