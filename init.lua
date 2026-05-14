-- ============================================================================
-- NeoVim Configuration Entry Point
-- Migrated from ~/.vim/vimrc
-- ============================================================================

-- Set leader key early
vim.g.mapleader = '\\'
vim.g.maplocalleader = '\\'

-- Load configuration modules
require('config.options')
require('config.keymaps')
require('config.autocmds')
require('config.functions')

-- Bootstrap lazy.nvim plugin manager
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Load plugins
require('lazy').setup('plugins', {
  change_detection = {
    notify = false,
  },
})

print('NeoVim configuration loaded!')
