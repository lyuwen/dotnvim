-- ============================================================================
-- NeoVim Options
-- Migrated from ~/.vim/vimrc
-- ============================================================================

local opt = vim.opt

-- General
-- Note: 'compatible' is not available in NeoVim (always nocompatible)
opt.wildmenu = true
opt.updatetime = 250
opt.tabpagemax = 100
opt.backspace = { 'indent', 'eol', 'start' }
opt.autoread = true
-- Note: 'encoding' is always utf-8 in NeoVim
opt.modeline = true

-- Search
opt.incsearch = true
opt.hlsearch = false

-- Indentation (line 112 in vimrc: tabstop=2 expandtab shiftwidth=2 softtabstop=2)
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true
opt.cindent = true

-- Line numbers
opt.number = true
opt.relativenumber = false  -- Toggled by autocmd based on mode/focus

-- Splits
opt.splitbelow = true
opt.splitright = true

-- UI
opt.laststatus = 2
opt.termguicolors = true
opt.background = 'dark'

-- Completion
opt.completeopt = { 'longest', 'menuone' }

-- Folding
opt.foldenable = false

-- Paste mode toggle (use keymap instead, pastetoggle not available in NeoVim)
vim.keymap.set('n', '<F4>', ':set paste!<CR>', { noremap = true, silent = true })

-- Enable syntax highlighting
vim.cmd('syntax on')

-- GUI settings (if running in GUI)
if vim.fn.has('gui_running') == 1 then
  opt.lines = 50
  opt.columns = 200
end

-- Clipboard (set to unnamed on macOS, line 131)
if vim.fn.has('mac') == 1 then
  opt.clipboard = 'unnamed'
end
