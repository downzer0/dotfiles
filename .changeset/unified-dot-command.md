---
"tk-dotfiles": major
---

Unified dotfiles management with intelligent `dot` command

This is a major refactor that consolidates all dotfiles management into a single, intelligent `dot` command with three subcommands:

**New Commands:**
- `dot bootstrap` - First-time setup (gitconfig, symlinks, Homebrew installation)
- `dot install` - Full installation (packages, configs, macOS defaults)
- `dot update` - Smart periodic updates (default - only updates what's needed)

**Key Features:**
- Intelligent updates that check before acting (no unnecessary operations)
- Consistent, beautiful terminal output with color-coded sections
- Only prompts for sudo when actually needed
- Shows what changed vs. what was already up-to-date
- Backward compatible with existing `script/bootstrap` and `script/install`

**Breaking Changes:**
- The `bin/dot` command now requires explicit subcommands or defaults to `update`
- Running `dot` without arguments now runs smart updates instead of full installation
- The keep-alive sudo background process is only started when needed

**Migration:**
- Existing workflows using `script/bootstrap` or `script/install` continue to work
- Update any automation or documentation to use `dot bootstrap`, `dot install`, or `dot update`
- For periodic updates, simply run `dot` or `dot update`
