#!/bin/bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
DOTFILES_TO_LINK=(.gitconfig .vimrc .zsh .zshenv .zshrc)

FORCE=false
for arg in "$@"; do
  case "$arg" in
    -f|--force) FORCE=true ;;
    -h|--help)
      cat <<EOF
Usage: $(basename "$0") [-f|--force]

  -f, --force   Recreate existing symlinks (unlink, then link again).
                Real files/directories are never touched.
  -h, --help    Show this help message.
EOF
      exit 0 ;;
    *)
      echo "Unknown option: $arg" >&2
      exit 1 ;;
  esac
done

# Link $1 -> $2. Existing real files/dirs are skipped (never removed).
# Existing symlinks are kept as-is, unless --force is set, in which case
# they are unlinked and recreated.
link() {
  local src="$1" dst="$2" label="$3"

  if [ -L "$dst" ]; then
    if [ "$FORCE" = true ]; then
      unlink "$dst"
    else
      echo "  ✓ $label (symlink already present)"
      return
    fi
  elif [ -e "$dst" ]; then
    echo "  ⚠ Skipping $label (real file/dir at destination — leaving untouched)"
    return
  fi

  ln -s "$src" "$dst"
  echo "  ✓ Linked $label"
}

echo "📦 Installing dotfiles from $SCRIPT_DIR..."
[ "$FORCE" = true ] && echo "  (force mode: existing symlinks will be recreated)"

# 1. Symlink root dotfiles
for dotfile in "${DOTFILES_TO_LINK[@]}"; do
  link "$SCRIPT_DIR/$dotfile" "$HOME/$dotfile" "$dotfile"
done

# 2. Symlink .config/
mkdir -p "$HOME/.config"
for item in "$SCRIPT_DIR"/.config/*; do
  name=$(basename "$item")
  link "$item" "$HOME/.config/$name" ".config/$name"
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
