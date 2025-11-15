---
"tk-dotfiles": minor
---

Add quick install script for fresh machines

Added a convenient one-liner installation script that makes it easy to bootstrap dotfiles on a fresh macOS machine:

```sh
bash -c "$(curl -fsSL https://raw.githubusercontent.com/akornmeier/dotfiles/main/install.sh)"
```

**Features:**
- Automatically clones the dotfiles repository
- Detects if dotfiles already exist and offers to update
- Checks for Git installation and provides helpful guidance
- Runs `dot bootstrap` to set up everything
- Intelligent handling of existing installations (offers update via `dot update`)

**Documentation:**
- Updated README with "Quick Install" section at the top
- Reorganized Getting Started to show the easiest method first
- Moved Prerequisites to a more logical position
