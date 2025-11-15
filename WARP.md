# WARP.md

This file provides guidance to WARP (warp.dev) when working with code in this repository.

## Project Overview

This is a personal dotfiles repository forked from @Holman's dotfiles, customized for managing macOS development environment configuration. The repository uses a topic-based organizational structure where configuration files are grouped by tool or system component (git, zsh, macos, etc.).

## Key Commands

### Initial Setup

```bash
# Clone and bootstrap the environment
git clone https://github.com/akornmeier/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
script/bootstrap
```

The bootstrap script handles:

- Git configuration setup
- Symlink creation for dotfiles
- Homebrew installation check
- Optional full installation via `script/install`

### Maintenance

```bash
# Update all packages and configurations
dot

# Edit dotfiles in default editor
dot --edit
```

### Manual Installation Steps

```bash
# Run only the installation (packages, Node.js, macOS defaults)
script/install
```

## Architecture

### Directory Structure & Loading Order

**Topic-Based Organization**: Each subdirectory represents a "topic" (e.g., `git/`, `zsh/`, `macos/`, `fnm/`)

**File Naming Conventions**:

- `*.symlink` - Files that get symlinked to `$HOME` as hidden files (e.g., `gitconfig.symlink` → `~/.gitconfig`)
- `path.zsh` - Loaded first to set up `$PATH` and environment
- `*.zsh` - Loaded into the shell environment (except path and completion files)
- `completion.zsh` - Loaded last for autocomplete setup
- `install.sh` - Topic-specific installation scripts

**Loading Sequence** (from `zsh/zshrc.symlink`):

1. Load all `path.zsh` files
2. Load all other `.zsh` files (excluding path and completion)
3. Initialize `compinit`
4. Load Homebrew zsh plugins
5. Load all `completion.zsh` files
6. Initialize Oh My Zsh (if installed)
7. Initialize Starship prompt

### Package Management

**Brewfile**: Single source of truth for all installed software

- Brew formulas: CLI tools (git, fnm, starship, etc.)
- Casks: GUI applications (Chrome, Discord, Warp, Zoom)
- Taps: Additional Homebrew repositories (mongodb/brew)
- Mac App Store apps: Currently commented out due to macOS Sequoia compatibility issues

### Node.js Management via FNM

**Critical Design Decision**: This repository uses FNM (Fast Node Manager) instead of Homebrew's Node.js or nvm.

**System-Wide Access**: Node.js binaries are symlinked to `/usr/local/bin/` for:

- Claude MCP servers
- GUI applications requiring Node.js
- System services and LaunchAgents

**Location**: `~/.local/share/fnm/aliases/default/bin/`

**Configuration**:

- Auto-switching enabled via `.node-version` files
- Corepack enabled for pnpm/yarn management
- LTS version set as default

**IMPORTANT**: If any Homebrew formula installs node as a dependency, it will be automatically removed by `fnm/install.sh` and `bin/dot`.

### Custom Functions & Scripts

**bin/**: Scripts in this directory are added to `$PATH`

- `dot` - Main maintenance script for updates
- `e` - Editor shortcuts
- `set-defaults` - Wrapper for macOS defaults

**functions/**: Shell functions with tab completion

- `c` - Quick project directory navigation (uses `$PROJECTS` variable)
- `extract` - Universal archive extraction
- `_c` - Completion helper for `c` function

### macOS System Configuration

**macos/set-defaults.sh**: Applies opinionated macOS system preferences

- Finder settings (list view, show extensions, reveal hidden files)
- Keyboard settings (fast repeat rate, disable press-and-hold)
- Screen settings (disable shadow in screenshots, save to ~/Pictures)
- Dock settings (speed up animations, hide recent apps)
- Activity Monitor settings (show all processes, sort by CPU)

**Requires sudo**: Password prompts are managed by parent scripts

## Environment Variables

- `$DOTFILES` - Path to this repository (`~/.dotfiles`)
- `$PROJECTS` - Default project directory (`~/Code`)
- `$HOMEBREW_PREFIX` - Homebrew installation path (auto-detected by architecture)
- `$GPG_TTY` - Required for GPG commit signing

**Private Variables**: Store in `~/.localrc` (not tracked in repo)

## Git Configuration

**Local Configuration**: `git/gitconfig.local.symlink` (gitignored)

- Created during bootstrap with user-specific name/email
- Generated from `git/gitconfig.local.symlink.example`

**Aliases** (from `git/aliases.zsh`):

- `glog` - Formatted graph log
- `gl` - Pull with prune
- `gp` - Push to origin HEAD
- `gac` - Add all and commit with message
- Uses GitHub CLI (`gh`) via oh-my-zsh plugin

## Zsh Configuration

**Plugin Manager**: Oh My Zsh (optional, auto-detected)

**Active Oh My Zsh Plugins**: aliases, bun, deno, fnm, gh, z

**Homebrew Zsh Plugins**:

- zsh-autocomplete
- zsh-autosuggestions
- zsh-you-should-use
- zsh-history-substring-search
- zsh-syntax-highlighting

**Prompt**: Starship (configured separately)

## Development Workflow

### Adding New Dotfiles

1. Create file with `.symlink` extension in appropriate topic directory
2. Run `script/bootstrap` to create symlink

### Adding New Zsh Configuration

1. Create `.zsh` file in topic directory
2. Use `path.zsh` for PATH modifications
3. Use `completion.zsh` for completion setup
4. Restart shell or run `source ~/.zshrc`

### Adding New Software

1. Add entry to `Brewfile` (brew/cask/mas)
2. Run `brew bundle install` or `dot`

### Testing Changes

- Zsh config: `source ~/.zshrc` or open new shell
- Symlinks: Check `~/.filename` points to correct source
- Homebrew: `brew bundle check` to verify Brewfile state

## Known Issues

**Mac App Store (`mas`)**: Disabled on macOS Sequoia (15.x) due to authentication issues. Install these apps manually:

- Be Focused, CopyClip, Dato, Hand Mirror, Keycastr, Lungo, Magnet

**Homebrew Node.js Conflicts**: If Homebrew installs node as a dependency, maintenance scripts automatically remove it to prevent conflicts with FNM.

## Important Notes

- Database services (MongoDB, PostgreSQL, Redis) are installed but not auto-started. Use `brew services start <service>` manually.
- Password prompts during installation are normal for: FNM symlinks (first run), macOS defaults (system-level preferences)
- Git delta is used for syntax-highlighted diff output
- All symlinked files in `$HOME` use the dotfile naming convention (leading dot)
