# TK Dotfiles

This repo contains my dotfiles. There are many others like it, but this one is mine. My dotfiles are my best friend. It is my life. I must master it as I must master my life. Without me, my dotfiles are useless. Without my dotfiles, I am useless.

Forked from @Holman's dotfiles, I took his general premise and edited them to fit my own needs.
They are split into the main areas I use (JavaScript, Node, git, system libraries, and so on), so the project is structured accordingly.

## What's inside

A lot of stuff. Seriously, a lot of stuff. Check them out in the file browser
above and see what components may mesh with you.
[Fork it](https://github.com/akornmeier/dotfiles/fork), remove what you don't
use, and build on what you do use.

## components

Below is the general layout of my setup. Please review this _**before**_
running the install scripts.

- **bin/**: Anything in `bin/` will be added to your `$PATH` and 
  available everywhere.
- **Brewfile**: Manages three types of applications:

  1. Brew Tap - service level tasks
  2. Brew formulas - command-line tools and packages
  3. Cask - GUI applications like Chrome, Discord, Warp, and Zoom
  
  **Note**: Mac App Store apps via `mas` are currently disabled due to compatibility issues with macOS Sequoia (15.x). These apps are commented out in the Brewfile and should be installed manually through the App Store.
  
  **You'll want to edit this file before you run the initial setup**.
  
- **topic/\*.zsh**: Any files ending in `.zsh` get loaded into your
  environment.
- **topic/path.zsh**: Any file named `path.zsh` is loaded first and is
  expected to set up `$PATH` or similar.
- **topic/completion.zsh**: Any file named `completion.zsh` is loaded
  last and is expected to set up autocomplete.
- **topic/\*.symlink**: Any files ending in `*.symlink` get symlinked into
  your `$HOME`. This is so you can keep all of those versioned in your dotfiles
  but still keep those autoloaded files in your home directory. These get
  symlinked in when you run `script/bootstrap`.

## Getting Started

### Prerequisites

Before running the installation, you'll want to review and customize:
- **Brewfile**: Edit to include/exclude applications you want installed
- **zsh/zshrc.symlink**: Update paths specific to your machine
- **macos/set-defaults.sh**: Review macOS system preferences to be set

### Installation

Clone the repository and run the bootstrap script:

```sh
# Clone (or fork) the repo
git clone https://github.com/akornmeier/dotfiles.git ~/.dotfiles

# Navigate to the directory
cd ~/.dotfiles

# Run the bootstrap script
script/bootstrap
```

The bootstrap script will:
1. 🔧 Set up your Git configuration (name and email)
2. 🔗 Create symlinks for dotfiles in your home directory
3. 📦 Check if Homebrew is installed (installs if needed)
4. ❓ Prompt you to continue with the full installation

If you choose to continue, the installation will:
1. 📦 Install all packages from the Brewfile (brew, cask, and mas apps)
2. 🔍 Check for macOS software updates (optional)
3. 🔧 Set up FNM and Node.js LTS
4. 🍎 Apply macOS system defaults

### Password Prompts

You may be prompted for your password a few times during installation:
1. **For FNM symlinks** (only on first run) - Creates system-wide Node.js access
2. **For macOS defaults** - Applies system-level preferences

On subsequent runs, if everything is already configured, you may not be prompted at all!

### What Gets Installed

- **Homebrew packages**: Command-line tools like git, fnm, starship, etc.
- **Cask applications**: GUI apps like Chrome, Discord, Warp, Zoom
- **Node.js**: Latest LTS version via FNM
- **Oh My Zsh**: If not already installed
- **macOS preferences**: System defaults and configurations

**Note on Mac App Store Apps**: Due to compatibility issues with `mas` on macOS Sequoia (15.x), Mac App Store apps must be installed manually. The following apps are recommended but commented out in the Brewfile:
- Be Focused (Pomodoro Timer)
- CopyClip (Clipboard Manager)
- Dato (Calendar/Time Zone App)
- Hand Mirror (Screen Mirroring)
- Keycastr (Keystroke Visualizer)
- Lungo (Prevents Sleep)
- Magnet (Window Manager)

## Keeping Things Up-to-Date

Run the `dot` command periodically to keep your environment fresh:

```sh
dot
```

The `dot` script will:
- 🔄 Update Homebrew and upgrade all packages
- 🔄 Run all installer scripts to ensure everything is configured
- 🔄 Apply the latest macOS defaults
- 🧹 Clean up outdated Homebrew packages

You can find this script in `bin/dot`.

## Troubleshooting

### Mac App Store Apps (Mas)

The `mas` CLI tool has known compatibility issues with macOS Sequoia (15.x) and newer versions. Due to Apple's changes in the App Store authentication system:
- `mas account` and `mas signin` commands no longer work
- Installation often fails with `PKInstallErrorDomain Code=201` errors
- Even after manually "purchasing" apps, installation may fail

**Solution**: Install Mac App Store apps manually through the App Store GUI. All `mas` entries in the Brewfile are commented out by default.

### FNM and Node.js

FNM (Fast Node Manager) is used instead of nvm for better performance. Node.js binaries are symlinked to `/usr/local/bin` for system-wide access, which is particularly useful for:
- Claude MCP servers
- GUI applications that need Node.js
- System services and LaunchAgents
