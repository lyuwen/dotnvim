-- ============================================================================
-- Git Plugins
-- Git integration (fugitive, gv, etc.)
-- ============================================================================

return {
  -- Fugitive (line 32)
  { 'tpope/vim-fugitive' },

  -- GV (line 33)
  { 'junegunn/gv.vim' },

  -- Gitsigns (modern replacement for gitgutter, line 39)
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup({
        signs = {
          add = { text = '+' },
          change = { text = '~' },
          delete = { text = '_' },
          topdelete = { text = '‾' },
          changedelete = { text = '~' },
        },
      })
    end,
  },
}
