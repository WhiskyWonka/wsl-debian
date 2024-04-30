#!/bin/bash
CONFIG_WSL_DEBIAN_REPOSITORY_PATH="$HOME/configs/wsl-debian"
# Sync shell initiation file
rsync  -au "$HOME/.zshrc" "$CONFIG_WSL_DEBIAN_REPOSITORY_PATH/ohmyz/.zshrc"
# Sync p10k confuration file (oh my zh theme)
rsync  -au "$HOME/.p10k.zsh" "$CONFIG_WSL_DEBIAN_REPOSITORY_PATH/ohmyz/.p10k.zsh"
# Sync aliases file
rsync  -au "$HOME/.my-scripts/aliases.sh" "$CONFIG_WSL_DEBIAN_REPOSITORY_PATH/ohmyz/aliases.sh"
# Syc colorls dark theme configuration
rsync  -au "$HOME/.config/colorls/dark_colors.yaml" "$CONFIG_WSL_DEBIAN_REPOSITORY_PATH/colorls/dark_colors.yaml"
# Sync neofetch logos directory
rsync -au "$HOME/.config/neofetch/logos" "$CONFIG_WSL_DEBIAN_REPOSITORY_PATH/neofetch/"
# Sync neofetch config file
rsync -au "$HOME/.config/neofetch/config.conf" "$CONFIG_WSL_DEBIAN_REPOSITORY_PATH/neofetch/config.confs"
# Sync windows terminal config file
rsync -au "/mnt/c/Users/rggri/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/settings.json" "$CONFIG_WSL_DEBIAN_REPOSITORY_PATH/wsl/settings.json"
# Sync it self
rsync -au "$HOME/.my-scripts" "$CONFIG_WSL_DEBIAN_REPOSITORY_PATH"

# BOLDT repo path
BOLDT_REPOSITORY_PATH="$HOME/BOLDT"
# Sync BOLDT documentation from note to pc repo
rsync -au "/mnt/rgg-lenovo" "$BOLDT_REPOSITORY_PATH"