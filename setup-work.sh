#!/bin/bash
echo "Deploying nix configuration..."
nix run github:nix-community/home-manager -- switch --flake ~/dotfiles/nix#yurihummel@fretebras

echo "Deploying user dotfiles..."
stow -R --no-folding bash mc nvim wezterm tmux
