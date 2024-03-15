#!/bin/bash

programming_languages=(
    "java 21.0.2-amzn"
    "groovy 4.0.19"
    "gradle 8.6"
    "maven 3.9.6"
    "kotlin 1.9.23"
    "quarkus 3.8.2"
)

load_sdkman_env() {
    source $HOME/.sdkman/bin/sdkman-init.sh
}

# Check if SDKMAN is installed
if [ ! -d "$HOME/.sdkman" ]; then
    echo "Installing SDKMAN!..."
    curl -s "https://get.sdkman.io" | bash || {
        echo "Error: Failed to install SDKMAN."
            exit 1
        }
    else
        echo "SDKMAN! is already installed."
fi

load_sdkman_env

# Check if SDKMAN is installed
if ! command -v sdk > /dev/null; then
    echo "Error: SDKMAN is not installed. Please install SDKMAN first."
    exit 1
fi

# Read and install languages from the programming_languages array
for entry in "${programming_languages[@]}"; do
    # Split the string into language and version
    IFS=' ' read -r language version <<< "$entry"
    echo "Installing $language version $version..."

    # Use SDKMAN to install the language and version
    sdk install $language $version || {
        echo "Error: Failed to install $language version $version."
            exit 1
        }
        sdk use $language $version

    # Check if installation was successful
    if [ $? -eq 0 ]; then
        echo "Installed $language version $version successfully."
    else
        echo "Error: Failed to set $language version $version as default."
        exit 1
    fi
done

echo "All installations completed."

