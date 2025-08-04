require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Explorer" })

map("n", "<leader>w", "<cmd>w<CR>", { desc = "Save File" })
map("n", "<leader>q", "<cmd>qa<CR>", { desc = "Quit" })

map("n", "<S-l>", function ()
  require("nvchad.tabufline").next()
end, { desc = "buffer goto next" })
map("n", "<S-h>", function ()
  require("nvchad.tabufline").prev()
end, { desc = "buffer goto prev" })
