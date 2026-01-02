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
echo "To activate it, add the following line to your config file:"

CURRENT_SHELL=$(basename "$SHELL")
case "$CURRENT_SHELL" in
    "fish")
        echo "  starship init fish | source"
        ;;
    "zsh")
        echo "  eval \"\$(starship init zsh)\""
        ;;
    "bash")
        echo "  eval \"\$(starship init bash)\""
        ;;
    "ion")
        echo "  eval \$(starship init ion)"
        ;;
    "tcsh")
        echo "  eval \`starship init tcsh\`"
        ;;
    "xonsh")
        echo "  execx(\$(starship init xonsh))"
        ;;
    "elvish")
        echo "  eval (starship init elvish)"
        ;;
    *)
        echo "Detected shell: $CURRENT_SHELL"
        echo "Please check the Starship documentation for setup instructions:"
        echo "https://starship.rs/guide/#step-2-set-up-your-shell-to-use-starship"
        ;;
esac