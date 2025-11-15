---
"tk-dotfiles": minor
---

Add local code formatting and linting tools

Added oxlint and prettier as local dev dependencies for maintaining code quality in the dotfiles project:

**New Dev Dependencies:**
- `oxlint@^0.13.0` - Fast, minimal JavaScript/TypeScript linter from Oxc project
- `prettier@^3.4.2` - Opinionated code formatter

**Configuration Files:**
- `.prettierrc` - Prettier configuration with sensible defaults (single quotes, no semis, 100 char width)
- `.prettierignore` - Excludes node_modules, build outputs, and system files
- `oxlint.json` - Oxlint configuration with basic rules

**New Scripts:**
- `pnpm format` - Format all files with prettier
- `pnpm format:check` - Check if files are formatted correctly
- `pnpm lint` - Run oxlint on the project

**Use Cases:**
- Maintain consistent formatting across shell scripts, JSON, YAML, and Markdown
- Catch common issues in JavaScript/JSON files
- Ensure code quality before commits
