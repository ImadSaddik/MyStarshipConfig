#!/bin/bash

CONFIG_FILE="starship.toml"
TARGET_DIR="$HOME/.config"
TARGET_FILE="$TARGET_DIR/starship.toml"
BACKUP_FILE="$TARGET_FILE.backup"

echo "Setting up Starship configuration"

if ! command -v starship &> /dev/null; then
    echo "Starship is not installed. Installing it now"
    curl -sS https://starship.rs/install.sh | sh
else
    echo "Starship is already installed."
fi

if [ ! -d "$TARGET_DIR" ]; then
    echo "Creating $TARGET_DIR directory"
    mkdir -p "$TARGET_DIR"
fi

if [ -f "$TARGET_FILE" ]; then
    echo "Found existing starship.toml. Backing it up to $BACKUP_FILE"
    mv "$TARGET_FILE" "$BACKUP_FILE"
fi

echo "Copying new configuration"
cp "$CONFIG_FILE" "$TARGET_FILE"

echo ""
echo "Done! Your shell prompt is now updated."
echo "If you haven't already, make sure to add 'eval \"\$(starship init bash)\"' to your .bashrc or appropriate shell config file."