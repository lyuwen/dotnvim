# Git Repository Management Guide

Your NeoVim configuration is now tracked with Git!

## Repository Information

- **Location**: `~/.config/nvim/`
- **Branch**: `main`
- **Initial commit**: `3b56760`
- **Files tracked**: 21 files (1805 lines)

## Common Git Commands

### Check Status
```bash
cd ~/.config/nvim
git status
```

### View Changes
```bash
git diff                    # See unstaged changes
git diff --staged           # See staged changes
```

### Commit Changes
```bash
git add .                   # Stage all changes
git add lua/config/keymaps.lua  # Stage specific file
git commit -m "Description of changes"
```

### View History
```bash
git log                     # Full history
git log --oneline           # Compact history
git log --graph --oneline   # Visual history
```

### Undo Changes
```bash
git checkout -- <file>      # Discard changes to file
git reset HEAD <file>       # Unstage file
git reset --soft HEAD~1     # Undo last commit (keep changes)
git reset --hard HEAD~1     # Undo last commit (discard changes)
```

## Recommended Workflow

### After Making Changes
```bash
cd ~/.config/nvim
git status                  # See what changed
git diff                    # Review changes
git add .                   # Stage changes
git commit -m "Brief description"
```

### Example Commits
```bash
# After adding a new plugin
git commit -m "Add telescope.nvim for fuzzy finding"

# After changing keybindings
git commit -m "Update window navigation keybindings"

# After fixing an issue
git commit -m "Fix LSP deprecation warning"
```

## Backup to Remote Repository

### Option 1: GitHub
```bash
# Create a new repository on GitHub, then:
git remote add origin https://github.com/yourusername/nvim-config.git
git branch -M main
git push -u origin main
```

### Option 2: GitLab
```bash
git remote add origin https://gitlab.com/yourusername/nvim-config.git
git branch -M main
git push -u origin main
```

### Option 3: Private Git Server
```bash
git remote add origin user@server:/path/to/nvim-config.git
git push -u origin main
```

## Sync Across Machines

### On First Machine (after making changes)
```bash
cd ~/.config/nvim
git add .
git commit -m "Update configuration"
git push
```

### On Second Machine (to get updates)
```bash
cd ~/.config/nvim
git pull
```

## Branching for Experiments

### Create a Branch for Testing
```bash
git checkout -b experiment-new-theme
# Make changes...
git add .
git commit -m "Test new colorscheme"
```

### Switch Back to Main
```bash
git checkout main
```

### Merge Experiment if Successful
```bash
git merge experiment-new-theme
```

### Delete Branch if Not Needed
```bash
git branch -d experiment-new-theme
```

## Restore Previous Version

### View History
```bash
git log --oneline
```

### Restore Specific File from Previous Commit
```bash
git checkout <commit-hash> -- lua/config/keymaps.lua
```

### Restore Entire Config to Previous State
```bash
git checkout <commit-hash> .
```

## .gitignore

The following are ignored (won't be tracked):
- `lazy-lock.json` - Plugin lock file (auto-generated)
- Plugin data directories
- Swap files (*.swp, *.swo)
- Local customizations (*.local.lua)
- OS files (.DS_Store, Thumbs.db)

## Best Practices

1. **Commit often**: Small, focused commits are easier to understand
2. **Write clear messages**: Describe what and why, not how
3. **Test before committing**: Make sure config works
4. **Use branches**: For experimental changes
5. **Push regularly**: Keep remote backup up-to-date

## Quick Reference

```bash
# Daily workflow
cd ~/.config/nvim
git status                  # Check changes
git add .                   # Stage all
git commit -m "message"     # Commit
git push                    # Push to remote (if configured)

# View history
git log --oneline --graph --all

# Undo last commit (keep changes)
git reset --soft HEAD~1

# Discard all local changes
git reset --hard HEAD
```

## Useful Aliases

Add these to your `~/.gitconfig`:

```ini
[alias]
    st = status
    co = checkout
    ci = commit
    br = branch
    lg = log --oneline --graph --all
    last = log -1 HEAD
    unstage = reset HEAD --
```

Then use:
```bash
git st      # Instead of git status
git lg      # Pretty log
git last    # Show last commit
```

## Current Repository Status

```
Repository: ~/.config/nvim/.git
Branch: main
Commit: 3b56760
Files: 21 tracked files
Status: Clean (all changes committed)
Remote: Not configured (local only)
```

## Next Steps

1. **Configure remote** (optional): Push to GitHub/GitLab for backup
2. **Make changes**: Edit your config as needed
3. **Commit regularly**: Track your customizations
4. **Create branches**: For experimental features

Your NeoVim configuration is now version-controlled! 🎉
