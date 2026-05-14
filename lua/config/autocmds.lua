-- ============================================================================
-- Autocommands
-- Migrated from ~/.vim/vimrc
-- ============================================================================

-- ============================================================================
-- Relative Number Toggle (lines 87-91)
-- ============================================================================

local numbertoggle = vim.api.nvim_create_augroup('numbertoggle', { clear = true })

vim.api.nvim_create_autocmd(
  { 'BufEnter', 'FocusGained', 'InsertLeave', 'WinEnter' },
  {
    group = numbertoggle,
    callback = function()
      if vim.opt.number:get() and vim.fn.mode() ~= 'i' then
        vim.opt.relativenumber = true
      end
    end,
  }
)

vim.api.nvim_create_autocmd(
  { 'BufLeave', 'FocusLost', 'InsertEnter', 'WinLeave' },
  {
    group = numbertoggle,
    callback = function()
      if vim.opt.number:get() then
        vim.opt.relativenumber = false
      end
    end,
  }
)

-- ============================================================================
-- NERDTree/NvimTree Auto-open for Directories (lines 199-201)
-- ============================================================================

vim.api.nvim_create_autocmd('VimEnter', {
  callback = function()
    if vim.fn.argc() == 1 and vim.fn.isdirectory(vim.fn.argv()[1]) == 1 then
      -- Will use NvimTree instead of NERDTree
      vim.cmd('NvimTreeOpen ' .. vim.fn.argv()[1])
    end
  end,
})

-- Auto-close if NvimTree is the last window
vim.api.nvim_create_autocmd('BufEnter', {
  callback = function()
    if vim.fn.winnr('$') == 1 and vim.bo.filetype == 'NvimTree' then
      vim.cmd('q')
    end
  end,
})

-- ============================================================================
-- Jump to Last Position (lines 296-299)
-- ============================================================================

vim.api.nvim_create_autocmd('BufReadPost', {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- ============================================================================
-- Git Commit: Always Start on First Line (lines 291)
-- ============================================================================

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'gitcommit',
  callback = function()
    vim.api.nvim_create_autocmd('BufEnter', {
      buffer = 0,
      once = true,
      callback = function()
        vim.api.nvim_win_set_cursor(0, { 1, 0 })
      end,
    })
  end,
})

-- ============================================================================
-- Python Template (line 226)
-- ============================================================================

vim.api.nvim_create_autocmd('BufNewFile', {
  pattern = '*.py',
  callback = function()
    local template = vim.fn.expand('$HOME/.vim/templates/python.temp')
    if vim.fn.filereadable(template) == 1 then
      vim.cmd('0r ' .. template)
    end
  end,
})
