require "nvchad.mappings"

-- add yours here

local nomap = vim.keymap.del
nomap("n", "<leader>h")
nomap("n", "<leader>v")
nomap("n", "<leader>b")
nomap("n", "<leader>n")
nomap("n", "<leader>wk")
nomap("n", "<leader>wK")
nomap("n", "<leader>ds")
nomap("n", "<leader>gt")
nomap("n", "<leader>pt")
nomap("n", "<leader>ff")
nomap("n", "<leader>fw")
nomap("n", "<leader>fb")
nomap("n", "<leader>fh")
nomap("n", "<leader>fo")
nomap("n", "<leader>fz")
nomap("n", "<leader>fa")
nomap("n", "<leader>fm")
nomap("n", "<leader>ma")
nomap("n", "<leader>rn")
nomap("n", "<leader>ch")
nomap("n", "<leader>cm")

local map = vim.keymap.set
local wk = require("which-key")

map('n', '<C-n>', '<C-f>', { noremap = true, silent = true, desc = 'Page Down' })
map('v', '<C-n>', '<C-f>', { noremap = true, silent = true, desc = 'Page Down' })
map("v", ">", ">gv", { silent = true })
map("v", "<", "<gv", { silent = true })

wk.add({ "<leader>x", icon = { icon = " ", color = "red" } })
wk.add({ "<leader>X", icon = { icon = " ", color = "red" } })
map('n', "<leader>X", '<cmd>%bd|e#<cr>', { desc = 'Close all other buffers' })

wk.add({ "<leader>e", icon = { icon = "󰙅 ", color = "yellow" } })
map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Explorer" })

wk.add({ "<leader>w", icon = { icon = " ", color = "green" } })
map("n", "<leader>w", "<cmd>w<CR>", { desc = "Save file" })

map("n", "<leader>q", "<cmd>qa<CR>", { desc = "Quit" })

wk.add({ '<leader>h', icon = { icon = ' ', color = 'yellow' } })
map('n', '<leader>h', '<cmd>nohl<cr>', { desc = 'Remove highlight' })

map("n", "<S-l>", function ()
  require("nvchad.tabufline").next()
end, { desc = "buffer goto next" })
map("n", "<S-h>", function ()
  require("nvchad.tabufline").prev()
end, { desc = "buffer goto prev" })

wk.add({'<leader>t', group = 'Todo', icon = { icon = '󰄵 ', color = 'green' } })

wk.add({ "<leader>o", group = "Obsidian", mode = {'n', 'v'}, icon = { icon = " ", color = "cyan" } })
map("n", "<leader>oo", "<cmd>Obsidian quick_switch<cr>", { desc = "Quick switch" })
map("n", "<leader>oO", "<cmd>Obsidian open<cr>", { desc = "Open in Obsidian" })
map("n", "<leader>os", "<cmd>Obsidian search<cr>", { desc = "Search" })
map("n", "<leader>ot", "<cmd>Obsidian tags<cr>", { desc = "Tags" })
map("n", "<leader>on", "<cmd>Obsidian new<cr>", { desc = "Create new note" })
map("n", "<leader>oh", "<cmd>e /Users/bailey/PKM/Home.md<cr>", { desc = "Go to Home" })
map("n", "<leader>of", "<cmd>Obsidian follow_link<cr>", { desc = "Follow note reference" })
map("n", "<leader>ob", "<cmd>Obsidian backlinks<cr>", { desc = "List references to current buffer" })
map("n", "<leader>ot", "<cmd>Obsidian today<cr>", { desc = "Open/create a daily note" })
map("n", "<leader>oy", "<cmd>Obsidian yesterday<cr>", { desc = "Open daily not for previous day" })
map("n", "<leader>oD", "<cmd>Obsidian dailies<cr>", { desc = "List daily notes" })
map("v", "<leader>ol", "<cmd>Obsidian link<cr>", { desc = "Link text to a note" })
map("v", "<leader>oL", "<cmd>Obsidian link_new<cr>", { desc = "Link text to a new note" })
map("v", "<leader>oT", "<cmd>Obsidian toc<cr>", { desc = "Open table of contents" })

wk.add({ "<leader>c", group = "Copilot", mode = { "n", "v" }, icon = { icon = " ", color = "green" } })
map("n", "<leader>cc", "<cmd>CopilotChatToggle<cr>", { desc = "Toggle chat window" })
map("n", "<leader>ct", "<cmd>CopilotChatTests<cr>", { desc = "Generate tests" })
map("n", "<leader>cd", "<cmd>CopilotChatDocs<cr>", { desc = "Add documentation" })
map("n", "<leader>cr", "<cmd>CopilotChatReview<cr>", { desc = "Review code" })
map("n", "<leader>co", "<cmd>CopilotChatOptimize<cr>", { desc = "Optimize code" })
map("v", "<leader>ct", "<cmd>CopilotChatTests<cr>", { desc = "Generate tests" })
map("v", "<leader>cd", "<cmd>CopilotChatDocs<cr>", { desc = "Add documentation" })
map("v", "<leader>cr", "<cmd>CopilotChatReview<cr>", { desc = "Review code" })
map("v", "<leader>co", "<cmd>CopilotChatOptimize<cr>", { desc = "Optimize code" })
map("v", "<leader>cc", "<cmd>CopilotChatGenerateSwaggerDocs<cr>", { desc = "Generate swagger docs" })

wk.add({ "<leader>j", group = "jq", icon = { icon = "󰘦 ", color = "green" } })
map("n", "<leader>jf", "<cmd>%!jq<cr><cmd>setlocal filetype=json<cr>", { desc = "Format json" })
map("n", "<leader>js", "<cmd>setlocal filetype=json<cr>", { desc = "Set filetype to json" })
map("n", "<leader>jl", "<leader>VGgJ", { desc = "Make single line" })
map("n", "<leader>jr", "<cmd>%s/\\\\\"/\"/g<cr>", { desc = "Replace all \\\" with \"" })

wk.add({ "<leader>S", icon = { icon = " ", color = "green" } })
map("n", "<leader>SS", "<cmd>set spell!<cr>", { desc = "Spell check" })
map("n", "<leader>SC", "z=", { desc = "Spell choice" })
map("n", "<leader>SL", "]=", { desc = "Next misspelled word" })
map("n", "<leader>SH", "[=", { desc = "Previous misspelled word" })

wk.add({ "<leader>n", icon = { icon = "󰝜 ", color = "green" } })
map("n", "<leader>n", "<cmd>enew<cr>", { desc = "New tab" })

wk.add({ "<leader>p", icon = { icon = " ", color = "cyan" } })
map("n", "<leader>p", "<cmd>Telescope projects<cr>", { desc = "Projects" })

wk.add({ "<leader>L", group = "LSP", icon = { icon = " ", color = "green"} })
map("n", "<leader>La", "<cmd>lua vim.lsp.buf.code_action()<cr>", { desc = "Code action" })
map("n", "<leader>Ld", "<cmd>Telescope diagnostics bufnr=0 theme=get_ivy<cr>", { desc = "Buffer diagnostics" })
map("n", "<leader>LD", "<cmd>Telescope diagnostics<cr>", { desc = "Diagnostics" })
map("n", "<leader>Li", "<cmd>checkhealth vim.lsp<cr>", { desc = "Info" })
map("n", "<leader>LI", "<cmd>Mason<cr>", { desc = "Mason" })
map("n", "<leader>Lj", "<cmd>lua vim.diagnostic.goto_next()<cr>", { desc = "Next diagnostic" })
map("n", "<leader>Lk", "<cmd>lua vim.diagnostic.goto_prev()<cr>", { desc = "Prev diagnostic" })
map("n", "<leader>Lq", "<cmd>lua vim.cmd.copen()<cr>", { desc = "Open quickfix list" })
-- map("n", "<leader>Ll", "<cmd><cr>", { desc = "CodeLens action" })
-- map("n", "<leader>Lq", "<cmd><cr>", { desc = "Quickfix" })
-- map("n", "<leader>Ls", "<cmd><cr>", { desc = "Document symbols" })
-- map("n", "<leader>LS", "<cmd><cr>", { desc = "Workspace symbols" })
-- map("n", "<leader>Le", "<cmd><cr>", { desc = "Telescope quickfix" })

wk.add({ "<leader>g", group = "Git", icon = { icon = "󰮠 ", color = "orange" } })
map("n", "<leader>gg", "<cmd>lua require 'configs.lazygit'.lazygit_toggle()<cr>", { desc = "Lazygit" })
map("n", "<leader>gd", "<cmd>!gh dash<cr>", { desc = "Dash" })
map("n", "<leader>gb", "<cmd>lua require 'gitsigns'.blame_line()<cr>", { desc = "Blame" })
map("n", "<leader>gB", "<cmd>lua require 'gitsigns'.blame_line({full=true})<cr>", { desc = "Blame line (full)" })

wk.add({ "<leader>C", icon = { icon = " ", color = "yellow" } })
map("n", "<leader>C", ":e $MYVIMRC | :cd %:p:h | wincmd k | pwd<cr>", { desc = "Config" })

wk.add({ "<leader>P", icon = { icon = " ", color = "yellow" } })
map("n", "<leader>P", "<cmd>Lazy<cr>", { desc = "Plugins" })

wk.add({ "<leader>f", icon = { icon = " ", color = "red" } })
map("n", "<leader>f", "<cmd>Telescope find_files follow=true no_ignore=false hidden=false<cr>", { desc = "Find files" })

wk.add({ "<leader>s", group = "Search", icon = { icon = " ", color = "blue" } })
map("n", "<leader>st", "<cmd>Telescope live_grep<cr>", { desc = "Text" })
map("n", "<leader>sb", "<cmd>Telescope live_grep<cr>", { desc = "Text in buffer" })
map("n", "<leader>sc", "<cmd>Telescope git_commits<cr>", { desc = "Git commits" })

wk.add({ "<leader>T", group = "Terminal", icon = { icon = "  ", color = "green" } })
map("n", "<leader>TF", "<cmd>FloatermNew<cr>", { desc = "Floating terminal" })
map("n", "<leader>TV", "<cmd>FloatermNew --wintype=vsplit<cr>", { desc = "Split vertical" })
map("n", "<leader>TH", "<cmd>FloatermNew --wintype=split<cr>", { desc = "Split horizontal" })
map("n", "<leader>TT", "<cmd>FloatermToggle<cr>", { desc = "Toggle terminal" })
function open_terminal_with_cmd()
  local cmd = vim.fn.input('Terminal command: ')
  if cmd ~= '' then
    vim.cmd('FloatermNew ' .. cmd)
  else
    vim.cmd('FloatermNew')
  end
end
map("n", "<leader>TC", "<cmd>lua open_terminal_with_cmd()<cr>", { desc = "Open terminal with cmd" })

map('n', '<C-a>', '<cmd>TmuxNavigateLeft<cr>', { desc = 'TMUX Left' })
map('n', '<C-s>', '<cmd>TmuxNavigateDown<cr>', { desc = 'TMUX Down' })
map('n', '<C-d>', '<cmd>TmuxNavigateUp<cr>', { desc = 'TMUX Up' })
map('n', '<C-f>', '<cmd>TmuxNavigateRight<cr>', { desc = 'TMUX Right' })

local harpoon = require("harpoon")
local harpoon_extensions = require("harpoon.extensions")
harpoon:setup()
map('n', '<C-q>', function () harpoon.ui:toggle_quick_menu(harpoon:list()) end)
map('n', '<C-w>', function () harpoon:list():select(1) end)
map('n', '<C-e>', function () harpoon:list():select(2) end)
map('n', '<C-r>', function () harpoon:list():select(3) end)
map('n', '<C-t>', function () harpoon:list():select(4) end)
map('n', '<C-y>', function () harpoon:list():add() end)
harpoon:extend(harpoon_extensions.builtins.highlight_current_file())

