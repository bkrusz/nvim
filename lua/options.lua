require "nvchad.options"

-- add yours here!
vim.o.termguicolors = true
vim.lsp.set_log_level(vim.log.levels.ERROR)
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakat = [[\ \ ;:,!?]]
vim.wo.relativenumber = true
vim.opt.conceallevel = 1
-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
