return {
  { "neovim/nvim-lspconfig", config = function() require "configs.lspconfig" end },
  { "mfussenegger/nvim-jdtls" },
  { "voldikss/vim-floaterm", lazy = false },
  { "akinsho/toggleterm.nvim", version = "*", config = true },
  { "folke/which-key.nvim", opts = { delay = 500 } },
  { "nvim-tree/nvim-tree.lua", opts = { filters = { dotfiles = false } } },
  { 'onsails/lspkind.nvim' },
  { 'ahmedkhalf/project.nvim', lazy = false, config = function() require('project_nvim').setup { patterns = { '.git', 'Makefile', 'package.json', 'gradle.properties' } } end }
}
