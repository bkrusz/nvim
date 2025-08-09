local map = vim.keymap.set
local wk = require("which-key")

wk.add({ "<leader>l", group = "Kotlin", icon = { icon = "󱈙 ", color = "purple" } })
map("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", { desc = "Code actions" })
map("n", "<leader>lb", "<cmd>FloatermNew gradle build<cr>", { desc = "Gradle build" })
map("n", "<leader>lc", "<cmd>FloatermNew gradle check<cr>", { desc = "Gradle check" })
map("n", "<leader>lr", "<cmd>FloatermNew gradle run<cr>", { desc = "Gradle run" })

map("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", { desc ="Show hover" })
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", { desc ="Goto definition" })
map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", { desc ="Goto declaration" })
map("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", { desc ="Goto references" })
map("n", "gI", "<cmd>lua vim.lsp.buf.implementation()<cr>", { desc ="Goto implementation" })
map("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", { desc ="Goto signature_help" })
map("n", "gl", function()
                  local float = vim.diagnostic.config().float

                  if float then
                    local config = type(float) == "table" and float or {}
                    config.scope = "line"

                    vim.diagnostic.open_float(config)
                  end
                end, { desc ="Goto signature_help" })
