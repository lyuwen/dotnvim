-- ============================================================================
-- UI Plugins
-- Colorscheme, statusline, etc.
-- ============================================================================

return {
  -- Solarized colorscheme (line 83 in vimrc)
  {
    'maxmx03/solarized.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      vim.o.background = 'dark'
      require('solarized').setup({
        transparent = { enabled = false },  -- Fix: transparent should be a table
        styles = {
          comments = { italic = true },
          functions = { bold = true },
        },
      })
      vim.cmd('colorscheme solarized')
    end,
  },

  -- Airline statusline (lines 28-29, 120-123)
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup({
        options = {
          theme = 'solarized_dark',
          icons_enabled = true,
          component_separators = { left = '', right = '' },
          section_separators = { left = '', right = '' },
        },
      })
    end,
  },

  -- Icons
  { 'nvim-tree/nvim-web-devicons' },
}
