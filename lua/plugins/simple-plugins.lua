return {
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
}
