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

local map = vim.keymap.set
local wk = require("which-key")

map("n", "q", "<cmd>close<cr>", { buffer = true })
map("v", ">", ">gv", { silent = true })
map("v", "<", "<gv", { silent = true })

wk.add({ "<leader>x", icon = { icon = " ", color = "red" } })

wk.add({ "<leader>e", icon = { icon = "󰙅 ", color = "yellow"}})
map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Explorer" })

wk.add({ "<leader>w", icon = { icon = " ", color = "green" } })
map("n", "<leader>w", "<cmd>w<CR>", { desc = "Save file" })

map("n", "<leader>q", "<cmd>qa<CR>", { desc = "Quit" })

map("n", "<S-l>", function ()
  require("nvchad.tabufline").next()
end, { desc = "buffer goto next" })
map("n", "<S-h>", function ()
  require("nvchad.tabufline").prev()
end, { desc = "buffer goto prev" })

wk.add({ "<leader>t", group = "Terminal", icon = { icon = "  ", color = "green" } })
map("n", "<leader>tf", "<cmd>FloatermNew<cr>", { desc = "Floating terminal" })
map("n", "<leader>tv", "<cmd>FloatermNew --wintype=vsplit<cr>", { desc = "Split vertical" })
map("n", "<leader>th", "<cmd>FloatermNew --wintype=split<cr>", { desc = "Split horizontal" })
map("n", "<leader>tt", "<cmd>FloatermToggle<cr>", { desc = "Toggle terminal" })

wk.add({ "<leader>o", group = "Obsidian", icon = { icon = " ", color = "cyan" } })
map("n", "<leader>oo", "<cmd>ObsidianQuickSwitch<cr>", { desc = "Quick switch" })
map("n", "<leader>os", "<cmd>ObsidianSearch<cr>", { desc = "Search" })
map("n", "<leader>on", "<cmd>ObsidianNew<cr>", { desc = "Create new note" })
map("n", "<leader>oh", "<cmd>e /Users/bkrusze/notes/notes/home-4346.md<cr>", { desc = "Go to Home" })
map("n", "<leader>of", "<cmd>ObsidianFollowLink<cr>", { desc = "Follow note reference" })
map("n", "<leader>ob", "<cmd>ObsidianBacklinks<cr>", { desc = "List references to current buffer" })
map("n", "<leader>ot", "<cmd>ObsidianToday<cr>", { desc = "Open/create a daily note" })
map("n", "<leader>oy", "<cmd>ObsidianYesterday<cr>", { desc = "Open daily not for previous day" })
map("v", "<leader>ol", "<cmd>ObsidianLink<cr>", { desc = "Link text to a note" })
map("v", "<leader>oL", "<cmd>ObsidianLinkNew<cr>", { desc = "Link text to a new note" })

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
map("n", "<leader>S", "<cmd>setlocal spell spelllang=en_us<cr>", { desc = "Spell check",  })

wk.add({ "<leader>n", icon = { icon = "󰝜 ", color = "green" } })
map("n", "<leader>n", "<cmd>enew<cr>", { desc = "New tab" })

wk.add({ "<leader>P", icon = { icon = " ", color = "cyan" } })
map("n", "<leader>P", "<cmd>Telescope projects<cr>", { desc = "Projects" })

wk.add({ "<leader>L", group = "LSP", icon = { icon = " ", color = "green"} })
map("n", "<leader>La", "<cmd>lua vim.lsp.buf.code_action()<cr>", { desc = "Code action" })
map("n", "<leader>Ld", "<cmd>Telescope diagnostics bufnr=0 theme=get_ivy<cr>", { desc = "Buffer diagnostics" })
map("n", "<leader>Lw", "<cmd>Telescope diagnostics<cr>", { desc = "Diagnostics" })
map("n", "<leader>Li", "<cmd>LspInfo<cr>", { desc = "Info" })
map("n", "<leader>LI", "<cmd>Mason<cr>", { desc = "Mason" })
map("n", "<leader>Lj", "<cmd>lua vim.diagnostic.goto_next()<cr>", { desc = "Next diagnostic" })
map("n", "<leader>Lk", "<cmd>lua vim.diagnostic.goto_prev()<cr>", { desc = "Prev diagnostic" })
map("n", "<leader>Ll", "<cmd><cr>", { desc = "CodeLens action" })
map("n", "<leader>Lq", "<cmd><cr>", { desc = "Quickfix" })
map("n", "<leader>Ls", "<cmd><cr>", { desc = "Document symbols" })
map("n", "<leader>LS", "<cmd><cr>", { desc = "Workspace symbols" })
map("n", "<leader>Le", "<cmd><cr>", { desc = "Telescope quickfix" })

wk.add({ "<leader>g", group = "Git", icon = { icon = "󰮠 ", color = "orange" } })
map("n", "<leader>gg", "<cmd>lua require 'configs.lazygit'.lazygit_toggle()<cr>", { desc = "Lazygit" })

wk.add({ "<leader>C", icon = { icon = " ", color = "yellow" } })
map("n", "<leader>C", ":e $MYVIMRC | :cd %:p:h | wincmd k | pwd<cr>", { desc = "Config" })

wk.add({ "<leader>p", icon = { icon = " ", color = "yellow" } })
map("n", "<leader>p", "<cmd>Lazy<cr>", { desc = "Plugins" })

wk.add({ "<leader>f", icon = { icon = " ", color = "red" } })
map("n", "<leader>f", "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<cr>", { desc = "Find files" })

wk.add({ "<leader>s", group = "Search", icon = { icon = " ", color = "blue" } })
map("n", "<leader>st", "<cmd>Telescope live_grep<cr>", { desc = "Text" })
map("n", "<leader>sb", "<cmd>Telescope live_grep<cr>", { desc = "Text in buffer" })
map("n", "<leader>sc", "<cmd>Telescope git_commits<cr>", { desc = "Git commits" })

local harpoon = require("harpoon")
local harpoon_extensions = require("harpoon.extensions")
harpoon:setup()
map('n', '<C-y>', function () harpoon:list():add() end)
map('n', '<C-q>', function () harpoon.ui:toggle_quick_menu(harpoon:list()) end)
map('n', '<C-w>', function () harpoon:list():select(1) end)
map('n', '<C-e>', function () harpoon:list():select(2) end)
harpoon:extend(harpoon_extensions.builtins.highlight_current_file())



