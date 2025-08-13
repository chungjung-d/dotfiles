#!/usr/bin/env bash
set -euo pipefail

# Symlink helper
link() {
  src="$1"
  dst="$2"
  mkdir -p "$(dirname "$dst")"
  if [ -e "$dst" ] || [ -L "$dst" ]; then
    if [ "${FORCE:-0}" = "1" ]; then
      rm -rf "$dst"
    else
      echo "Skip: $dst exists (use FORCE=1 to overwrite)"
      return
    fi
  fi
  ln -s "$src" "$dst"
  echo "Linked: $dst -> $src"
}

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

# Kitty
link "$DOTFILES_DIR/.config/kitty/kitty.conf" "$HOME/.config/kitty/kitty.conf"
link "$DOTFILES_DIR/.config/kitty/dracula.conf" "$HOME/.config/kitty/dracula.conf"

# Starship
link "$DOTFILES_DIR/.config/starship.toml" "$HOME/.config/starship.toml"

# zsh
link "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"

# Brew bundle optional
if command -v brew >/dev/null 2>&1 && [ -f "$DOTFILES_DIR/Brewfile" ]; then
  echo "Applying Brewfile..."
  brew bundle --file="$DOTFILES_DIR/Brewfile"
fi

echo "Done. Open a new terminal or run: exec zsh"
