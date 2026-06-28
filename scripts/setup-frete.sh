#!/bin/bash

echo "Deploying nix configuration..."
nix run github:nix-community/home-manager -- switch --flake ./nix#frete

echo "Deploying user dotfiles..."
stow -R --no-folding bash mc nvim tmux

echo "Collecting Nix garbage..."
nix-collect-garbage

echo "Setup finished!"
