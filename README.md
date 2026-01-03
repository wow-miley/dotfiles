# Dotfiles

Personal dotfiles configuration for macOS development environment.

## What's Included

- **`.zshrc`** - Zsh shell configuration with custom prompt and git-chord integration
- **`.bash_config`** - Bash configuration sourcing shell prompt and gruvbox theme
- **`.shell_prompt.sh`** - Custom shell prompt created with promptline.vim
- **`.vimrc`** - Vim editor configuration
- **`.tmux.conf`** - tmux terminal multiplexer configuration
- **`.chunkwmrc`** - chunkwm tiling window manager configuration
- **`.skhdrc`** - skhd hotkey daemon configuration
- **`.gitignore`** - Git ignore patterns for the dotfiles repo

## Quick Start

### 1. Clone this repository

```bash
git clone git@github.com:wow-miley/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

### 2. Run the setup script

```bash
./setup.sh
```

The setup script will:
- Create symlinks for all dotfiles in your home directory
- Backup any existing dotfiles to `~/.dotfiles_backup_<timestamp>`
- Clone and install [git-chord](https://github.com/socket-link/git-chord) for vim-style composable git commands
- Prompt you to update git-chord if it's already installed

### 3. Apply the changes

Either restart your terminal or run:

```bash
source ~/.zshrc
```

## Manual Setup

If you prefer to set up manually:

1. **Create symlinks for individual files:**
   ```bash
   ln -s ~/dotfiles/.zshrc ~/.zshrc
   ln -s ~/dotfiles/.vimrc ~/.vimrc
   # ... and so on for other files
   ```

2. **Install git-chord:**
   ```bash
   git clone https://github.com/socket-link/git-chord.git ~/.git-chord
   ```

3. **Source your shell configuration:**
   ```bash
   source ~/.zshrc
   ```

## Dependencies

- **zsh** - Z shell (for .zshrc)
- **vim** - Text editor (for .vimrc)
- **tmux** - Terminal multiplexer (for .tmux.conf)
- **git** - Version control (required for git-chord)
- **chunkwm** - Tiling window manager (optional, for .chunkwmrc)
- **skhd** - Hotkey daemon (optional, for .skhdrc)

### Optional: Vim plugins

The configuration references vim plugins that should be installed:
- **gruvbox** - Color scheme (expects `~/.vim/bundle/gruvbox/`)
- **promptline.vim** - Statusline generator (used to create .shell_prompt.sh)

## Features

### git-chord Integration

The `.zshrc` automatically sources [git-chord](https://github.com/socket-link/git-chord) if installed, enabling vim-style composable git commands:

- Chain git operations: `g acp "commit message"` (add → commit → push)
- Single-character commands that compose into chords
- Positional arguments processed left-to-right

### Custom Shell Prompt

The shell prompt (`.shell_prompt.sh`) displays:
- Hostname (when in SSH session)
- Current user
- Current working directory
- Git branch information
- Last exit code (if non-zero)

## Updating

To update your dotfiles:

```bash
cd ~/dotfiles
git pull
```

To update git-chord:

```bash
cd ~/.git-chord
git pull
```

Or simply run `./setup.sh` again and choose to update when prompted.

## License

Personal configuration files - feel free to use and modify as needed.
