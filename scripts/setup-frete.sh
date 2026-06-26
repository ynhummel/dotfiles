#!/bin/bash

if nix config show experimental-features 2>/dev/null | grep -qw "flakes"; then
  echo "Flakes are already enabled. Skipping /etc/nix/nix.conf setup."
else
  echo "Flakes not enabled. Setting up /etc/nix/nix.conf..."

  if [ -f /etc/nix/nix.conf ] && [ ! -L /etc/nix/nix.conf ]; then
    echo "Backing up default nix.conf..."
    sudo mv /etc/nix/nix.conf /etc/nix/nix.conf.bak
  fi

  sudo ln -sf "$(pwd)/nix-conf/etc/nix/nix.conf" /etc/nix/nix.conf

  echo "Restarting nix-daemon to apply flakes..."
  sudo systemctl restart nix-daemon
fi

echo "Deploying nix configuration..."
nix run github:nix-community/home-manager -- switch --flake ./nix#frete

echo "Deploying user dotfiles..."
stow -R --no-folding bash mc nvim wezterm tmux

echo "Collecting Nix garbage..."
nix-collect-garbage

echo "Setup finished!"
