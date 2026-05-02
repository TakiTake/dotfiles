# dotfiles

Personal configuration files and shell setup for macOS/Linux environments. This repository contains curated zsh configuration, git settings, vim/neovim configs, and development tools.

## Quick Start

### Prerequisites

- **oh-my-zsh** installed ([install here](https://ohmyzsh.sh/))
- **Git** for cloning and version control
- **Zsh** as default shell

### Installation

Clone and run the installation script:

```bash
git clone https://github.com/TakiTake/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./init.sh
```

The `init.sh` script will:
1. Symlink dotfiles (`.gitconfig`, `.vimrc`, `.zsh`, `.zshenv`, `.zshrc`) to your home directory
2. Symlink `.config/` configurations
3. Clone and install oh-my-zsh plugins

After installation, start a new shell session to apply changes:

```bash
exec zsh
```

## What's Included

### Shell Configuration (`.zsh/`)

Modular zsh configuration files organized by number prefix for ordered loading:

- **`10_utils.zsh`** — Utility functions and helpers
- **`21_fzf-keybindings.zsh`** — FZF keybindings for git, ghq, and history navigation
- **`30_aliases.zsh`** — Shell aliases for common commands
- **`31_docker.zsh`** — Docker-related aliases and functions
- **`32_git.zsh`** — Git helper functions and aliases
- **`33_http-status.zsh`** — HTTP status code reference

### Core Configuration Files

- **`.zshrc`** — Main zsh configuration
  - Configured with `ys` theme
  - Enabled plugins: git, zsh-syntax-highlighting, zsh-completions, fzf
  - FZF extended options for better fuzzy finding
  - Integration with `mise` for tool version management
  - Google Cloud SDK integration (if installed)

- **`.zshenv`** — Environment variables loaded before `.zshrc`

- **`.gitconfig`** — Git configuration with custom aliases and settings

- **`.vimrc`** — Vim configuration and customizations

### Application Configuration (`.config/`)

- **`nvim/`** — Neovim configuration

## Key Features

- **Modern shell environment** — oh-my-zsh with curated plugins
- **Fuzzy finding** — FZF integration for searching files, history, git branches, and repositories
- **Git helpers** — Custom aliases and functions for efficient git workflows
- **Docker support** — Pre-configured Docker aliases
- **Multi-language support** — Integrated `mise` for managing Ruby, Node.js, Python, and other runtimes
- **HTTP utilities** — Quick reference for HTTP status codes
- **Interactive keybindings** — FZF-powered keybindings for git checkout, repository navigation, and command history
- **Syntax highlighting** — Real-time shell syntax highlighting

## Customization

Each configuration file is self-contained and can be modified independently:

- Add new aliases to `.zsh/30_aliases.zsh`
- Add new git functions to `.zsh/32_git.zsh`
- Customize the shell theme in `.zshrc` (currently set to `ys`)
- Add neovim plugins in `.config/nvim/`

Create additional `.zsh/<NUMBER>_<name>.zsh` files for modular additions — the init system loads files matching the `<->_*.zsh` pattern in numerical order.

## License

See [LICENSE](LICENSE) file for details.
