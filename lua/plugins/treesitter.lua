return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "java", "lua", "javascript", "markdown", "kotlin" },
      indent = { enabled = true },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-k>",
          node_incremental = "<C-k>",
          scope_incremental = false,
          node_decremental = "<C-j>",
        },
      },
    }
  }
}
