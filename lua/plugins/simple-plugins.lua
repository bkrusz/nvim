return {
<<<<<<<< HEAD:lua/plugins/simple-plugins.lua
  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  { "mfussenegger/nvim-jdtls" },
  { "voldikss/vim-floaterm", lazy = false },
  { "akinsho/toggleterm.nvim", version = "*", config = true },
  { "folke/which-key.nvim", opts = { delay = 500 } },
  { "nvim-tree/nvim-tree.lua", opts = { filters = { dotfiles = false } } },

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
========
    require('plugins.simple-plugins'),
    require('plugins.alpha'),
    require('plugins.obsidian'),
    require('plugins.tmux'),
    require('plugins.go'),
    require('plugins.rust'),
    require('plugins.xcode'),
    require('plugins.copilot'),
    require('plugins.colorizer'),
    require('plugins.testing'),
    require('plugins.harpoon'),
>>>>>>>> main:lua/plugins/init.lua
}
