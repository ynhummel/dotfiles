#!/bin/bash

echo "Deploying user dotfiles..."
stow -R --no-folding bash home-manager mc nix-modules nvim wezterm tmux
