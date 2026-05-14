# NeoVim Configuration

Migrated from `~/.vim/vimrc` to modern NeoVim with Lua configuration.

## Directory Structure

```
~/.config/nvim/
├── init.lua                    # Entry point
├── lua/
│   ├── config/
│   │   ├── options.lua        # All vim.opt settings
│   │   ├── keymaps.lua        # All keybindings
│   │   ├── autocmds.lua       # Autocommands
│   │   └── functions.lua      # Custom Lua functions
│   └── plugins/
│       ├── init.lua           # Plugin list loader
│       ├── ui.lua             # UI plugins (solarized, lualine)
│       ├── editor.lua         # Editor plugins (nvim-tree, tagbar, etc.)
│       ├── lsp.lua            # LSP configuration
│       ├── completion.lua     # Completion setup (nvim-cmp)
│       └── git.lua            # Git-related plugins
└── after/
    └── ftplugin/              # Filetype-specific settings
        ├── python.lua
        ├── tex.lua
        └── fortran.lua
```

## Key Features

### Core Settings
- **Leader key**: `\` (backslash, same as original vimrc)
- **Indentation**: 2 spaces, expandtab
- **Line numbers**: Absolute numbers with relative toggle based on mode/focus
- **Splits**: Open below and to the right
- **Colorscheme**: Solarized dark

### Key Mappings

#### General
- `<F5>` or `<leader>s` - Save file
- `<F2>` - Save and exit with confirmation
- `<F4>` - Toggle paste mode
- `<F9>` - Run file (Python, LaTeX, or Makefile)

#### Window Navigation
- `<leader>h/j/k/l` - Navigate between splits
- `<C-Left>/<C-Right>` - Navigate between tabs

#### File Explorer
- `<leader>nt` - Toggle NvimTree (file explorer)

#### Code Navigation
- `<F6>` - Toggle Tagbar
- `<leader>g` - Go to definition (LSP)
- `<leader>D` - Show hover documentation (LSP)
- `gd` - Go to definition
- `gr` - Find references
- `K` - Hover documentation

#### Editing
- `<leader>p` - Paste without overwriting register (visual mode)
- `<leader>tt` - Insert timestamp
- `gcc` - Toggle line comment
- `gc` - Toggle comment (with motion)

#### Git
- Standard vim-fugitive commands (`:Git`, `:Gstatus`, etc.)

### Plugins

#### UI
- **solarized.nvim** - Solarized colorscheme
- **lualine.nvim** - Modern statusline (replaces vim-airline)
- **nvim-web-devicons** - File icons

#### Editor
- **nvim-tree.lua** - File explorer (replaces NERDTree)
- **tagbar** - Code structure viewer
- **Comment.nvim** - Easy commenting (replaces NERDCommenter)
- **nvim-surround** - Surround text objects
- **vim-visual-multi** - Multiple cursors
- **LuaSnip** - Snippet engine
- **markdown-preview.nvim** - Markdown preview
- **vimtex** - LaTeX support
- **toggleterm.nvim** - Terminal integration

#### LSP & Completion
- **nvim-lspconfig** - LSP configuration
- **mason.nvim** - LSP installer
- **nvim-cmp** - Autocompletion (replaces YouCompleteMe/deoplete)
- **nvim-treesitter** - Better syntax highlighting

#### Git
- **vim-fugitive** - Git integration
- **gv.vim** - Git commit browser
- **gitsigns.nvim** - Git signs in gutter

## Installation

1. **Backup your existing config** (if any):
   ```bash
   mv ~/.config/nvim ~/.config/nvim.backup
   ```

2. **The configuration is already in place** at `~/.config/nvim/`

3. **Launch NeoVim** to install plugins:
   ```bash
   nvim
   ```
   
   Lazy.nvim will automatically install all plugins on first launch.

4. **Install language servers** (optional, Mason will prompt):
   - Python: `pyright`
   - Lua: `lua_ls`
   - Fortran: `fortls`

## Differences from Original Vimrc

### Modernizations
- **Plugin manager**: vim-plug → lazy.nvim
- **File explorer**: NERDTree → nvim-tree.lua
- **Statusline**: vim-airline → lualine.nvim
- **Completion**: YouCompleteMe/deoplete → nvim-cmp + LSP
- **Git signs**: vim-gitgutter → gitsigns.nvim
- **Commenting**: NERDCommenter → Comment.nvim
- **Terminal**: neoterm → toggleterm.nvim

### Removed Options
- `compatible` - Not available in NeoVim (always nocompatible)
- `encoding` - Always UTF-8 in NeoVim
- `pastetoggle` - Replaced with keymap toggle

### Plugin Changes
- **jedi-vim**: Still included but completion disabled (LSP handles it)
- **vim-ipython**: Not migrated (use toggleterm + ipython instead)
- **vim-cmake**: Only loads if cmake is installed
- **context.vim**: Replaced with nvim-treesitter-context

## Troubleshooting

### Plugins not loading
```bash
nvim --headless "+Lazy! sync" +qa
```

### LSP not working
1. Check if language server is installed:
   ```vim
   :Mason
   ```
2. Install missing servers from Mason UI

### Colorscheme issues
If solarized doesn't load, NeoVim will fall back to the default colorscheme.

### Python support warning
The jedi-vim warning about Python 3 can be ignored - LSP provides completion.

## Customization

### Adding new plugins
Edit `~/.config/nvim/lua/plugins/*.lua` and add plugin specs:

```lua
return {
  {
    'author/plugin-name',
    config = function()
      -- Plugin configuration
    end,
  },
}
```

### Changing keybindings
Edit `~/.config/nvim/lua/config/keymaps.lua`

### Changing options
Edit `~/.config/nvim/lua/config/options.lua`

## Migration Notes

All your original vimrc settings have been preserved:
- ✅ Leader key (`\`)
- ✅ Tab settings (2 spaces)
- ✅ Split behavior
- ✅ Line numbers with relative toggle
- ✅ Window navigation keybindings
- ✅ Custom functions (SaveExit, RunFile, etc.)
- ✅ Filetype-specific settings (Python, LaTeX, Fortran)
- ✅ Git commit behavior
- ✅ Template support

The configuration is fully functional and ready to use!
