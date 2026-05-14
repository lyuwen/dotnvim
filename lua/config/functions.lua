-- ============================================================================
-- Custom Functions
-- Migrated from ~/.vim/vimrc
-- ============================================================================

-- ============================================================================
-- Close Non-File Buffers (lines 248-255)
-- ============================================================================

function CloseNonFileBuf()
  if vim.bo.buftype == 'nofile' then
    vim.cmd('q')
    CloseNonFileBuf()
  else
    vim.cmd('only')
  end
end

-- ============================================================================
-- Save and Exit with Confirmation (lines 257-270)
-- ============================================================================

function SaveExit()
  if vim.bo.modified then
    local choice = vim.fn.confirm('Save before exit?', '&1 Save\n&2 No\n&3 Cancel', 3)
    if choice == 0 or choice == 3 then
      print('Abort quitting')
    elseif choice == 1 then
      vim.cmd('x')
    elseif choice == 2 then
      vim.cmd('q!')
    end
  else
    vim.cmd('quit')
  end
end

-- ============================================================================
-- Close and Quit (lines 272-279)
-- ============================================================================

function CloseQuit()
  if vim.bo.buftype == 'nofile' then
    vim.cmd('q')
  else
    vim.cmd('only')
    SaveExit()
  end
end

-- ============================================================================
-- Join Lines with Delimiter (lines 281-284)
-- ============================================================================

function JoinList(delimiter)
  local start_line = vim.fn.line("'<")
  local end_line = vim.fn.line("'>")

  -- Add delimiter to all lines except the last
  for i = start_line, end_line - 1 do
    vim.cmd(i .. 's/$/' .. delimiter .. '/')
  end

  -- Join all lines
  vim.cmd(start_line .. ',' .. end_line .. 'join')
end

-- ============================================================================
-- Run File Based on Type (lines 301-318)
-- ============================================================================

function RunFile()
  -- Check for SConstruct
  if vim.fn.filereadable('SConstruct') == 1 and vim.fn.executable('scons') == 1 then
    vim.cmd('!scons')
    return
  end

  -- Check for Makefile
  if vim.fn.filereadable('Makefile') == 1 or vim.fn.filereadable('makefile') == 1 then
    vim.cmd('!make')
    return
  end

  -- Run based on file extension
  local ext = vim.fn.expand('%:e')
  if ext == 'py' then
    vim.cmd('!python %')
  elseif ext == 'tex' then
    -- LaTeX build would go here
    print('LaTeX build: Use :VimtexCompile or similar')
  else
    print('No run command configured for .' .. ext .. ' files')
  end
end

-- Make functions globally available
_G.CloseNonFileBuf = CloseNonFileBuf
_G.SaveExit = SaveExit
_G.CloseQuit = CloseQuit
_G.JoinList = JoinList
_G.RunFile = RunFile
