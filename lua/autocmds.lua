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
vim.api.nvim_create_autocmd({ "FileType" },
  {
    group = "user",
    pattern = {
      "qf",
      "help",
      "man",
      "floaterm",
      "lspinfo",
      "lir",
      "lsp-installer",
      "null-ls-info",
      "tsplayground",
      "DressingSelect",
      "Jaq",
    },
    callback = function()
      vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = true })
      vim.opt_local.buflisted = false
    end,
  }
)
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client.name == "kotlin_lsp" then
      client.server_capabilities.sementicTokensProvider = nil
    end
  end,
})

