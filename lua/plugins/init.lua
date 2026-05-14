-- ============================================================================
-- Plugin Configuration
-- Using lazy.nvim as plugin manager (modern replacement for vim-plug)
-- ============================================================================

return {
  -- Load plugin modules
  { import = 'plugins.ui' },
  { import = 'plugins.editor' },
  { import = 'plugins.lsp' },
  { import = 'plugins.completion' },
  { import = 'plugins.git' },
}
