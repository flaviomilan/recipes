#!/bin/env bash

# install_system
source "bin/system-deb.sh"
install_system

# install starship
source "bin/starship-rs.sh"
install_starship

# asdf
source "bin/asdf.sh"
install_asdf
install_asdf_languages

# sdkman
source "bin/sdkman.sh"
install_sdkman
install_sdkman_languages

# rustup
source "bin/rustup.sh"
install_rustup
install_rustup_languages
