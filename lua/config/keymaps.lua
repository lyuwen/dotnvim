-- ============================================================================
-- Key Mappings
-- Migrated from ~/.vim/vimrc
-- ============================================================================

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- ============================================================================
-- General Mappings
-- ============================================================================

-- Save (F5 and <leader>s)
keymap('n', '<F5>', '<ESC>:w<CR>', opts)
keymap('n', '<leader>s', '<ESC>:w<CR>', opts)

-- Save and exit with confirmation (F2)
keymap('n', '<F2>', '<ESC>:lua SaveExit()<CR>', opts)

-- ============================================================================
-- Window Navigation (leader + hjkl, lines 104-110, 232-238)
-- ============================================================================

keymap('n', '<leader>j', '<C-W><C-J>', opts)
keymap('n', '<leader>k', '<C-W><C-K>', opts)
keymap('n', '<leader>l', '<C-W><C-L>', opts)
keymap('n', '<leader>h', '<C-W><C-H>', opts)

-- Terminal mode navigation - exit terminal and move to window
keymap('t', '<C-h>', '<C-\\><C-n><C-w>h', { desc = 'Exit terminal and move left' })
keymap('t', '<C-j>', '<C-\\><C-n><C-w>j', { desc = 'Exit terminal and move down' })
keymap('t', '<C-k>', '<C-\\><C-n><C-w>k', { desc = 'Exit terminal and move up' })
keymap('t', '<C-l>', '<C-\\><C-n><C-w>l', { desc = 'Exit terminal and move right' })

-- ============================================================================
-- Tab Navigation (Ctrl + Left/Right, line 239-240)
-- ============================================================================

keymap('n', '<C-Left>', ':tabprevious<CR>', opts)
keymap('n', '<C-Right>', ':tabnext<CR>', opts)

-- ============================================================================
-- Editing
-- ============================================================================

-- Paste and preserve register (line 151)
keymap('v', '<leader>p', '"_dP', opts)

-- Join lines with comma (line 286)
keymap('v', 'll', ':lua JoinList(",")<CR>', opts)

-- ============================================================================
-- Utility Functions
-- ============================================================================

-- Close non-file buffers (line 243)
keymap('n', '<leader>o', '<Esc>:lua CloseNonFileBuf()<CR>', opts)

-- Insert timestamp (line 324)
keymap('n', '<leader>tt', ':put =strftime(\"%c\")<CR>', { silent = true })

-- Word count for LaTeX (line 241)
keymap('n', '<F3>', ':w !detex | wc -w<CR>', opts)

-- Run file (line 319)
keymap('n', '<F9>', ':lua RunFile()<CR>', opts)

-- ============================================================================
-- Plugin-specific Mappings
-- ============================================================================

-- NERDTree toggle (line 202)
keymap('n', '<leader>nt', ':NvimTreeToggle<CR>', opts)

-- Tagbar toggle (line 148)
keymap('n', '<F6>', ':TagbarToggle<CR>', opts)

-- C/C++ header/source toggle (line 154)
keymap('n', '<F10>', ':tabnew %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>', opts)

-- YCM/LSP mappings (lines 157-158, 164, 171)
keymap('n', '<leader>yf', ':lua vim.g.ycm_auto_trigger=0<CR>', opts)  -- turn off YCM
keymap('n', '<leader>yo', ':lua vim.g.ycm_auto_trigger=1<CR>', opts)  -- turn on YCM
keymap('n', '<leader>g', ':lua vim.lsp.buf.definition()<CR>', opts)   -- Go to definition
keymap('n', '<leader>D', ':lua vim.lsp.buf.hover()<CR>', opts)        -- Hover documentation

-- Neoterm toggle (line 190, nvim-specific)
keymap('n', '<leader>t', ':Ttoggle<CR>', opts)

-- Terminal in splits with auto-close
keymap('n', '<leader>th', function()
  vim.cmd('split')
  vim.cmd('terminal')
  vim.cmd('startinsert')
  -- Auto-close terminal buffer when shell exits
  vim.api.nvim_create_autocmd('TermClose', {
    buffer = vim.api.nvim_get_current_buf(),
    callback = function()
      vim.cmd('bdelete!')
    end,
    once = true,
  })
end, { desc = 'Terminal in horizontal split (auto-close)' })

keymap('n', '<leader>tv', function()
  vim.cmd('vsplit')
  vim.cmd('terminal')
  vim.cmd('startinsert')
  -- Auto-close terminal buffer when shell exits
  vim.api.nvim_create_autocmd('TermClose', {
    buffer = vim.api.nvim_get_current_buf(),
    callback = function()
      vim.cmd('bdelete!')
    end,
    once = true,
  })
end, { desc = 'Terminal in vertical split (auto-close)' })
