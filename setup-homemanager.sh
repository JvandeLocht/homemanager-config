#!/bin/bash

# Perform initial install of home-manager with config
echo "experimental-features = nix-command flakes" | sudo tee -a /etc/nix/nix.conf
nix run home-manager/master -- init --switch -b backup --flake .
