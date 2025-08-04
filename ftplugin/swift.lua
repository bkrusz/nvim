require'lspconfig'.sourcekit.setup{
  cmd = {'/Applications/Developer_Tools/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/sourcekit-lsp'},
  root_dir = function()
    return vim.loop.cwd()
  end,
  vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
      --enable omnifunc completion
      vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

      -- buffer local mappings
      local opts = { buffer = ev.buf }
      -- go to definition
      vim.keymap.set('n','gd',vim.lsp.buf.definition,opts)
      --puts doc header info into a float page
      vim.keymap.set('n','K',vim.lsp.buf.hover,opts)

      -- workspace management. Necessary for multi-module projects
      vim.keymap.set('n','<space>wa',vim.lsp.buf.add_workspace_folder, opts)
      vim.keymap.set('n','<space>wr',vim.lsp.buf.remove_workspace_folder, opts)
      vim.keymap.set('n','<space>wl',function()
              print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end,opts)

      -- add LSP code actions
      vim.keymap.set({'n','v'},'<space>ca',vim.lsp.buf.code_action,opts)
      -- find references of a type
      vim.keymap.set('n','gr',vim.lsp.buf.references,opts)
    end,
  })
}

local linters = require "lvim.lsp.null-ls.formatters"
linters.setup { { command = "swiftformat", filetypes = { "swift" } } }
-- local opts = {
--   cmd = { "sourcekit-lsp" },
--   filetypes = { "swift", "objective-c", "objective-cpp" },
--   root_dir = root_pattern("Package.swift", ".git")
-- }
-- require("lvim.lsp.manager").setup("sourcekit", opts)
