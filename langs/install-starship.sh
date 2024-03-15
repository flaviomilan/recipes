#!/bin/bash

# Check if curl is installed
if ! command -v curl &> /dev/null; then
    echo "curl is required but not installed. Please install curl and run the script again."
    exit 1
fi

# Download and install starship
echo "Downloading starship..."
curl -fsSL https://starship.rs/install.sh | sh

echo "Starship installed successfully!"
