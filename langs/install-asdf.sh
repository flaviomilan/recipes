#!/bin/bash

programming_languages=(
    "nodejs latest"
    "python latest"
    "golang latest"
    "lua latest"
    "pnpm latest"
    "bun latest"
    "ruby latest"
    "julia latest"
)

# Check if ASDF is installed
if ! command -v asdf &> /dev/null; then
    echo "Installing ASDF..."
    git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.13.1
else
    echo "ASDF is already installed."
fi

# Load ASDF
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

# Check if ASDF is installed
if ! command -v asdf &> /dev/null; then
    echo "Error: ASDF is not installed. Please install ASDF first."
    exit 1
fi

# Read and install languages from the configuration file
for programming_language in "${programming_languages[@]}"; do
    # Split the string into language and version
    IFS=' ' read -r -a parts <<< "$programming_language"
    language="${parts[0]}"
    version="${parts[1]}"

    # Use ASDF to install the language and version
    echo "Installing $language version $version..."
    asdf plugin-add $language
    asdf install $language $version

    # Set the installed version as the global version
    asdf global $language $version

    # Check if installation was successful
    if [ $? -eq 0 ]; then
        echo "Installed $language version $version successfully."
    else
        echo "Failed to install $language version $version."
    fi
done

echo "All installations completed."

