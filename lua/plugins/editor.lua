-- ============================================================================
-- Editor Plugins
-- File explorer, tagbar, commenting, etc.
-- ============================================================================

return {
  -- NvimTree (modern replacement for NERDTree, line 26)
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('nvim-tree').setup({
        sort_by = 'case_sensitive',
        view = {
          width = 30,
        },
        renderer = {
          group_empty = true,
        },
        filters = {
          dotfiles = false,
        },
      })
    end,
  },

  -- Tagbar (line 27)
  {
    'preservim/tagbar',
    config = function()
      vim.g.tagbar_sort = 0

      -- LaTeX tagbar config (lines 327-340)
      vim.g.tagbar_type_tex = {
        ctagstype = 'latex',
        kinds = {
          's:sections',
          'g:graphics:0:0',
          'l:labels',
          'r:refs:1:0',
          'f:frames',
          'p:pagerefs:1:0',
          '?:unknown',
        },
        sort = 0,
      }

      -- JavaScript tagbar config (lines 343-361)
      vim.g.tagbar_type_javascript = {
        ctagstype = 'javascript',
        kinds = {
          'T:tags',
          'A:array literals:1:0',
          'O:object literals:1:0',
          'P:object properties:1:0',
          'G:generator functions',
          'F:freeform functions',
          'C:constructors and classes',
          'M:methods',
          'V:variables:0:0',
          'I:imports:1:0',
          'E:named exports:1:0',
          '?:unknown',
        },
        sort = 0,
      }
    end,
  },

  -- Commenting (line 37, NERDCommenter replacement)
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup({
        padding = true,
        sticky = true,
        ignore = nil,
        toggler = {
          line = 'gcc',
          block = 'gbc',
        },
        opleader = {
          line = 'gc',
          block = 'gb',
        },
      })
    end,
  },

  -- Surround (line 34)
  {
    'kylechui/nvim-surround',
    version = '*',
    event = 'VeryLazy',
    config = function()
      require('nvim-surround').setup({})
    end,
  },

  -- Multiple cursors (line 43)
  {
    'mg979/vim-visual-multi',
    branch = 'master',
  },

  -- Indent object (line 51)
  { 'michaeljsmith/vim-indent-object' },

  -- Snippets (lines 46-49)
  {
    'L3MON4D3/LuaSnip',
    version = 'v2.*',
    build = 'make install_jsregexp',
    dependencies = { 'rafamadriz/friendly-snippets' },
  },

  -- Markdown preview (line 40)
  {
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    ft = { 'markdown' },
    build = function()
      vim.fn['mkdp#util#install']()
    end,
    config = function()
      vim.g.instant_markdown_autostart = 0
    end,
  },

  -- VimWiki (line 44)
  {
    'vimwiki/vimwiki',
    init = function()
      vim.g.vimwiki_list = {
        {
          path = '~/vimwiki/',
          syntax = 'markdown',
          ext = '.md',
        },
      }
    end,
  },

  -- LaTeX support (line 30)
  {
    'lervag/vimtex',
    ft = 'tex',
    config = function()
      vim.g.tex_flavor = 'latex'
      vim.g.vimtex_view_method = 'zathura'
      vim.g.vimtex_compiler_latexmk = {
        build_dir = '',
        callback = 1,
        continuous = 1,
        executable = 'latexmk',
        options = {
          '-pdf',
          '-verbose',
          '-file-line-error',
          '-synctex=1',
          '-interaction=nonstopmode',
        },
      }
    end,
  },

  -- CMake support (line 50)
  {
    'cdelledonne/vim-cmake',
    cond = function()
      return vim.fn.executable('cmake') == 1
    end,
  },

  -- Terminal (line 57, neoterm)
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    config = function()
      require('toggleterm').setup({
        open_mapping = [[<leader>t]],
        direction = 'horizontal',
        size = 15,
      })
    end,
  },

  -- Diffchar (line 31)
  { 'rickhowe/diffchar.vim' },

  -- Python tools (lines 41-42)
  { 'tell-k/vim-autopep8', ft = 'python' },
  { 'nvie/vim-flake8', ft = 'python' },

  -- TOML support (line 62)
  { 'cespare/vim-toml', branch = 'main' },

  -- Context (line 63)
  {
    'nvim-treesitter/nvim-treesitter-context',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
  },
}
