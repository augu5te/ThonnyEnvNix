#!/usr/bin/env bash

# prepare launcher_command
mkdir -p ~/.local/bin
echo "nix --extra-experimental-features 'nix-command flakes' develop $PWD --command thonny" > ~/.local/bin/thonny-env.sh
chmod 755 ~/.local/bin/thonny-env.sh

# prepare ThonnyEnv.desktop
mkdir -p ~/.local/share/applications
cp share/ThonnyEnv-base.desktop ~/.local/share/applications/ThonnyEnv.desktop
echo "Exec=$HOME/.local/bin/thonny-env.sh" >> ~/.local/share/applications/ThonnyEnv.desktop

# copy ThonnyEnv icon
mkdir -p ~/.local/share/icons/hicolor/48x48/apps
cp share/thonny-env.png ~/.local/share/icons/hicolor/48x48/apps/thonny-env.png
