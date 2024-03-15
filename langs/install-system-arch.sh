#!/bin/bash

# Define an array with the packages to be installed
packages=(
    exa
    ripgrep
    bat
    fd
    tokei
    grex
    libyaml
    zsh
    unzip
    zip
    neovim
    base-devel
    bluez
    bluez-utils
    blueman
    alacritty
    polybar
    ranger
)

# Install packages silently
for package in "${packages[@]}"; do
    echo "Installing $package..."
    sudo pacman -Syuq --noconfirm "$package"

    if [ $? -eq 0 ]; then
        echo "Installed $package successfully."
    else
        echo "Failed to install $package."
    fi
done

sudo systemctl enable bluetooth.service
sudo systemctl start bluetooth.service

echo "All installations completed."
