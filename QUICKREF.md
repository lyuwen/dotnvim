# NeoVim Quick Reference

## Essential Keybindings

### File Operations
| Key | Action |
|-----|--------|
| `<F5>` | Save file |
| `<leader>s` | Save file (alternative) |
| `<F2>` | Save and exit with confirmation |
| `<F4>` | Toggle paste mode |

### Window Navigation
| Key | Action |
|-----|--------|
| `<leader>h` | Move to left split |
| `<leader>j` | Move to down split |
| `<leader>k` | Move to up split |
| `<leader>l` | Move to right split |
| `<C-Left>` | Previous tab |
| `<C-Right>` | Next tab |

### File Explorer & Navigation
| Key | Action |
|-----|--------|
| `<leader>nt` | Toggle NvimTree |
| `<F6>` | Toggle Tagbar |

### Code Navigation (LSP)
| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gr` | Find references |
| `K` | Hover documentation |
| `<leader>g` | Go to definition (alternative) |
| `<leader>D` | Hover documentation (alternative) |
| `<leader>rn` | Rename symbol |
| `<leader>ca` | Code action |
| `<leader>f` | Format code |

### Editing
| Key | Action |
|-----|--------|
| `gcc` | Toggle line comment |
| `gc{motion}` | Toggle comment with motion |
| `<leader>p` | Paste without overwriting register (visual) |
| `<leader>tt` | Insert timestamp |
| `<leader>o` | Close non-file buffers |

### Running Code
| Key | Action |
|-----|--------|
| `<F9>` | Run file (Python/LaTeX/Make) |
| `<F10>` | Toggle C/C++ header/source |

### Terminal
| Key | Action |
|-----|--------|
| `<leader>t` | Toggle terminal |

### Special Functions
| Key | Action |
|-----|--------|
| `<F3>` | Word count (LaTeX) |

## Leader Key

The leader key is `\` (backslash)

## Plugin Commands

### NvimTree
- `:NvimTreeToggle` - Toggle file explorer
- `:NvimTreeFocus` - Focus file explorer

### Lazy (Plugin Manager)
- `:Lazy` - Open plugin manager UI
- `:Lazy sync` - Update plugins
- `:Lazy clean` - Remove unused plugins

### Mason (LSP Installer)
- `:Mason` - Open LSP installer UI
- `:MasonInstall <server>` - Install language server

### Git (Fugitive)
- `:Git` - Git command
- `:Git status` - Git status
- `:Git commit` - Git commit
- `:Git push` - Git push
- `:GV` - Git commit browser

### LSP
- `:LspInfo` - Show LSP status
- `:LspRestart` - Restart LSP servers

### Treesitter
- `:TSUpdate` - Update parsers
- `:TSInstall <language>` - Install parser

## Completion

In insert mode:
- `<Tab>` - Next completion item / expand snippet
- `<S-Tab>` - Previous completion item
- `<CR>` - Confirm selection
- `<C-Space>` - Trigger completion
- `<C-e>` - Abort completion

## Tips

1. **First time setup**: Launch `nvim` and wait for plugins to install
2. **Install language servers**: Run `:Mason` and install needed servers
3. **Update plugins**: Run `:Lazy sync`
4. **Check health**: Run `:checkhealth`
5. **View this file**: `:e ~/.config/nvim/QUICKREF.md`
