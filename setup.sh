#!/bin/sh

# Install the Nix Package manager with flakes support
sh <(curl -L https://nixos.org/nix/install) --daemon
nix-env -f '<nixpkgs>' -iA nixUnstable
echo "experimental-features = nix-command flakes" | sudo tee -a /etc/nix/nix.conf

# Perform initial install of home-manager with config
nix run home-manager/master -- init --switch -b backup --flake .
