-- ============================================================================
-- AI Assistant Plugins
-- ============================================================================

return {
  -- Claude Code integration
  {
    "coder/claudecode.nvim",
    dependencies = { "folke/snacks.nvim" },
    config = true,
    keys = {
      { "<leader>a", nil, desc = "AI/Claude Code" },
      { "<leader>ac", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
      { "<leader>af", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
      { "<leader>ar", "<cmd>ClaudeCode --resume<cr>", desc = "Resume Claude" },
      { "<leader>aC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
      { "<leader>am", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select Claude model" },
      { "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current buffer" },
      { "<leader>as", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send to Claude" },
      { "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
      { "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny diff" },
    },
    opts = {
      -- Server configuration
      port_range = { min = 10000, max = 65535 },
      auto_start = true,
      log_level = "info",

      -- Behavior
      focus_after_send = false,
      track_selection = true,
      visual_demotion_delay_ms = 50,

      -- Terminal configuration
      terminal = {
        split_side = "right",
        split_width_percentage = 0.30,
        provider = "auto",
        auto_close = true,
      },

      -- Diff configuration
      diff_opts = {
        layout = "vertical",
        open_in_new_tab = false,
        keep_terminal_focus = false,
        hide_terminal_in_new_tab = false,
      },

      -- Use git repository root as working directory
      git_repo_cwd = true,
    },
  },
}
