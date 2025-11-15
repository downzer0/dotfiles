---
"tk-dotfiles": minor
---

Add beautiful ASCII art banner to dot command

Added a stunning gradient ASCII art banner that displays when running `dot` commands:

**New Dependencies:**
- `figlet` - ASCII art text generator
- `gradient-string` - Beautiful gradient colors for terminal output
- `@types/figlet` - TypeScript types for figlet

**Implementation:**
- Created `bin/lib/banner.mjs` - Node.js script that generates gradient ASCII art
- Uses "ANSI Shadow" font for bold, clear text
- Applies "cyber" color palette (cyan/blue gradient)
- Gracefully falls back to plain text if Node.js is unavailable
- Integrated into all main commands: `bootstrap`, `install`, and `update`

**Visual Enhancement:**
The banner adds a professional, eye-catching header to the dot command output, making it immediately clear when the dotfiles management system is running. The gradient colors match the modern, developer-focused aesthetic of the project.
