#!/bin/bash

# Define an array with the packages to be installed
packages=(
    exa
    ripgrep
    bat
    fd-find
    libyaml-dev
    zsh
    unzip
    zip
    ranger
    build-essential
    libssl-dev 
    zlib1g-dev 
    libbz2-dev
    libreadline-dev 
    libsqlite3-dev 
    wget 
    curl 
    llvm 
    libncurses5-dev 
    libncursesw5-dev
    xz-utils 
    tk-dev 
    libffi-dev 
    liblzma-dev 
    python3-openssl 
    git
)

# Install packages silently
for package in "${packages[@]}"; do
    echo "Installing $package..."
    sudo apt install -y "$package"

    if [ $? -eq 0 ]; then
        echo "Installed $package successfully."
    else
        echo "Failed to install $package."
    fi
done

echo "All installations completed."
