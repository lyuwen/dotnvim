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

  -- Which-key: shows keybinding popup overlay
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    config = function()
      local wk = require('which-key')
      wk.setup({
        preset = 'modern',
        delay = 500,
        plugins = {
          marks = true,
          registers = true,
          spelling = {
            enabled = true,
            suggestions = 20,
          },
        },
        win = {
          border = 'rounded',
          padding = { 1, 2 },
        },
      })

      -- Register leader key groups for better organization
      wk.add({
        { '<leader>a', group = 'AI/Claude' },
        { '<leader>n', group = 'NvimTree' },
        { '<leader>t', group = 'Timestamp/Terminal' },
        { '<leader>g', group = 'Go to/Git' },
      })
    end,
  },
}
