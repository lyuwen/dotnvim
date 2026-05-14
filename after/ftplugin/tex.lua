-- ============================================================================
-- LaTeX Filetype Settings
-- ============================================================================

-- LaTeX-specific settings (lines 135-144)
vim.opt_local.grepprg = 'grep -nH $*'
vim.g.tex_flavor = 'latex'

-- Disable folding for LaTeX
vim.g.Tex_FoldedSections = ''
vim.g.Tex_FoldedEnvironments = ''
vim.g.Tex_FoldedMisc = ''

-- Vimtex settings
vim.g.Tex_DefaultTargetFormat = 'pdf'
vim.g.Tex_MultipleCompileFormats = 'pdf'
vim.g.Tex_GotoError = 0
