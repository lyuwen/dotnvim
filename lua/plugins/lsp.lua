-- ============================================================================
-- LSP Configuration
-- Language Server Protocol setup
-- ============================================================================

return {
  -- LSP Config
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
    },
    config = function()
      -- Setup Mason (LSP installer)
      require('mason').setup()
      require('mason-lspconfig').setup({
        ensure_installed = {
          'pyright',      -- Python (line 55)
          'lua_ls',       -- Lua
          'fortls',       -- Fortran (lines 382-387)
        },
        automatic_installation = true,
      })

      -- LSP keybindings
      local on_attach = function(client, bufnr)
        local opts = { noremap = true, silent = true, buffer = bufnr }
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', '<leader>f', function()
          vim.lsp.buf.format({ async = true })
        end, opts)
      end

      -- Setup LSP servers
      local servers = {
        pyright = {
          on_attach = on_attach,
        },
        lua_ls = {
          on_attach = on_attach,
          settings = {
            Lua = {
              diagnostics = {
                globals = { 'vim' },
              },
            },
          },
        },
        fortls = {
          on_attach = on_attach,
          cmd = { 'fortls', '--notify_init', '--hover_signature', '--hover_language', 'fortran', '--use_signature_help' },
        },
      }

      -- Use new vim.lsp.config API for nvim 0.11+
      if vim.lsp.config then
        for server, config in pairs(servers) do
          vim.lsp.config(server, config)
        end
      else
        -- Fallback to old lspconfig for older nvim versions
        local lspconfig_ok, lspconfig = pcall(require, 'lspconfig')
        if lspconfig_ok then
          for server, config in pairs(servers) do
            if lspconfig[server] then
              lspconfig[server].setup(config)
            end
          end
        end
      end
    end,
  },

  -- Mason (LSP installer)
  { 'williamboman/mason.nvim' },
  { 'williamboman/mason-lspconfig.nvim' },

  -- Treesitter for better syntax highlighting
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      local status_ok, configs = pcall(require, 'nvim-treesitter.configs')
      if not status_ok then
        return
      end

      configs.setup({
        ensure_installed = { 'python', 'lua', 'vim', 'vimdoc', 'fortran', 'c', 'cpp', 'latex', 'javascript' },
        highlight = {
          enable = true,
        },
        indent = {
          enable = true,
        },
      })
    end,
  },
}
