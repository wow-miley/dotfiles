#!/bin/bash

# Dotfiles setup script
# This script sets up symlinks for all dotfiles and installs dependencies

set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_DIR="$HOME/.dotfiles_backup_$(date +%Y%m%d_%H%M%S)"

echo "Setting up dotfiles from $DOTFILES_DIR"

# Function to create symlink with backup
create_symlink() {
    local source="$1"
    local target="$2"

    if [ -e "$target" ] && [ ! -L "$target" ]; then
        echo "  Backing up existing $target to $BACKUP_DIR"
        mkdir -p "$BACKUP_DIR"
        mv "$target" "$BACKUP_DIR/"
    elif [ -L "$target" ]; then
        echo "  Removing existing symlink $target"
        rm "$target"
    fi

    echo "  Creating symlink: $target -> $source"
    ln -s "$source" "$target"
}

# Create symlinks for all dotfiles
echo ""
echo "Creating symlinks for dotfiles..."
for file in "$DOTFILES_DIR"/.*; do
    # Skip . and .. and .git directory
    basename=$(basename "$file")
    if [[ "$basename" == "." || "$basename" == ".." || "$basename" == ".git" || "$basename" == ".gitignore" ]]; then
        continue
    fi

    # Skip if it's a directory (except we want to link files)
    if [ -f "$file" ]; then
        create_symlink "$file" "$HOME/$basename"
    fi
done

# Install git-chord
echo ""
echo "Installing git-chord..."
GIT_CHORD_DIR="$HOME/.git-chord"

if [ -d "$GIT_CHORD_DIR" ]; then
    echo "  git-chord already exists at $GIT_CHORD_DIR"
    read -p "  Update it? (y/n) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        echo "  Updating git-chord..."
        cd "$GIT_CHORD_DIR"
        git pull
        cd "$DOTFILES_DIR"
    fi
else
    echo "  Cloning git-chord to $GIT_CHORD_DIR..."
    git clone https://github.com/socket-link/git-chord.git "$GIT_CHORD_DIR"
fi

echo ""
echo "Setup complete!"
echo ""
if [ -d "$BACKUP_DIR" ]; then
    echo "Your original dotfiles have been backed up to: $BACKUP_DIR"
    echo ""
fi
echo "To apply the changes, either:"
echo "  1. Restart your terminal, or"
echo "  2. Run: source ~/.zshrc"
