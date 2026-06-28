#!/bin/bash

echo "Deploying nix configuration..."
if command -v home-manager &> /dev/null; then
    home-manager switch --flake ~/dotfiles/nix#nana
else
    nix run github:nix-community/home-manager -- switch --flake ~/dotfiles/nix#nana
fi

echo "Deploying user dotfiles..."
stow -R --no-folding bash nvim tmux niri wayland-tools

echo "Cleaning nix garbage..."
nix-collect-garbage

echo "Setup finished!"
