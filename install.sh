#!/usr/bin/env bash

set -e

# This script installs the service menu, and attempts to detect the correct 
# icon name for your installation by searching common icon directories.

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
DESKTOP_FILE="openVSCode.desktop"
SOURCE="$SCRIPT_DIR/$DESKTOP_FILE"

if [ ! -f "$SOURCE" ]; then
    echo "Error: $DESKTOP_FILE not found in $SCRIPT_DIR"
    exit 1
fi

# Determine the correct service menus directory for the installed Plasma version.
if [ -n "$KDE_SESSION_VERSION" ] && [ "$KDE_SESSION_VERSION" -ge 6 ] 2>/dev/null; then
    DEST_DIR="$HOME/.local/share/kio/servicemenus"
else
    DEST_DIR="$HOME/.local/share/kservices5/ServiceMenus"
fi

# Detect the correct VS Code icon name by searching the system icon directories.
detect_icon() {
    local icon_dirs=(
        "$HOME/.local/share/icons"
        "/usr/share/icons"
        "/usr/share/pixmaps"
    )

    local icon_names=(
        "com.visualstudio.code"
        "vscode"
        "code"
        "visual-studio-code"
        "vs-code"
        "code-oss"
        "vscodium"
    )

    for name in "${icon_names[@]}"; do
        for dir in "${icon_dirs[@]}"; do
            if [ -d "$dir" ] && find "$dir" -name "${name}.*" -print -quit 2>/dev/null | grep -q .; then
                echo "$name"
                return
            fi
        done
    done

    # Fallback: no icon found, keep the default.
    echo "vscode"
}

ICON_NAME="$(detect_icon)"

mkdir -p "$DEST_DIR"
cp "$SOURCE" "$DEST_DIR/$DESKTOP_FILE"
sed -i "s/^Icon=.*/Icon=$ICON_NAME/" "$DEST_DIR/$DESKTOP_FILE"
chmod +x "$DEST_DIR/$DESKTOP_FILE"

echo "Installed to $DEST_DIR/$DESKTOP_FILE"
echo "Icon set to: $ICON_NAME"
