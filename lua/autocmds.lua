require "nvchad.autocmds"
vim.api.nvim_create_augroup("user", {})
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" },
  {
    group = "user",
    pattern = "*.md",
    command = "setlocal ts=2 sw=2",
  }
)
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" },
  {
    group = "user",
    pattern = "*.java",
    command = "setlocal ts=4 sw=4",
  }
)

