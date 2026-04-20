#!/bin/bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
DOTFILES_TO_LINK=(.gitconfig .vimrc .zsh .zshenv .zshrc)

echo "📦 Installing dotfiles from $SCRIPT_DIR..."

# 1. Symlink root dotfiles
for dotfile in "${DOTFILES_TO_LINK[@]}"; do
  src="$SCRIPT_DIR/$dotfile"
  dst="$HOME/$dotfile"

  if [ -e "$dst" ] && [ ! -L "$dst" ]; then
    echo "  ⚠ Skipping $dotfile (already exists, not a symlink)"
    continue
  fi

  ln -sfn "$src" "$dst"
  echo "  ✓ Linked $dotfile"
done

# 2. Symlink .config/
mkdir -p "$HOME/.config"
for item in "$SCRIPT_DIR"/.config/*; do
  name=$(basename "$item")
  ln -sfn "$item" "$HOME/.config/$name"
  echo "  ✓ Linked .config/$name"
done

# 3. Install oh-my-zsh plugins
if [ -d "$HOME/.oh-my-zsh" ]; then
  echo ""
  echo "🔌 Installing oh-my-zsh plugins..."

  ZSH_CUSTOM="${ZSH_CUSTOM:=$HOME/.oh-my-zsh/custom}"
  mkdir -p "$ZSH_CUSTOM/plugins"

  PLUGINS=(
    "zsh-users/zsh-syntax-highlighting"
    "zsh-users/zsh-completions"
  )

  for repo in "${PLUGINS[@]}"; do
    plugin_name="${repo##*/}"
    plugin_dir="$ZSH_CUSTOM/plugins/$plugin_name"

    if [ -d "$plugin_dir" ]; then
      echo "  ✓ $plugin_name (already installed)"
    else
      git clone --depth 1 "https://github.com/$repo.git" "$plugin_dir"
      echo "  ✓ $plugin_name installed"
    fi
  done
else
  echo ""
  echo "⚠ oh-my-zsh not installed at ~/.oh-my-zsh"
  echo "  Install it first:"
  echo "  sh -c \"\$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)\""
fi

echo ""
echo "✅ Installation complete!"
echo "💡 Start a new shell session to apply changes."
