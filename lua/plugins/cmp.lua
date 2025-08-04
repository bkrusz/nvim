return {
  {
    "hrsh7th/nvim-cmp",
    opts = {
      mapping = {
        ["Down"] = require("cmp").mapping.select_next_item(),
        ["Up"] = require("cmp").mapping.select_prev_item(),
        ["<C-d>"] = require("cmp").mapping.scroll_docs(-4),
        ["<C-f>"] = require("cmp").mapping.scroll_docs(4),
        ["<C-Space>"] = require("cmp").mapping.complete(),
        ["<C-e>"] = require("cmp").mapping.close(),

        ["<CR>"] = require("cmp").mapping.confirm {
          behavior = require("cmp").ConfirmBehavior.Insert,
          select = true,
        },

        ["<Tab>"] = require("cmp").mapping(function(fallback)
          if require("cmp").visible() then
            require("cmp").select_next_item()
          elseif require("luasnip").expand_or_jumpable() then
            require("luasnip").expand_or_jump()
          else
            fallback()
          end
        end, { "i", "s" }),

        ["<S-Tab>"] = require("cmp").mapping(function(fallback)
          if require("cmp").visible() then
            require("cmp").select_prev_item()
          elseif require("luasnip").jumpable(-1) then
            require("luasnip").jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      },
      sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "nvim_lua" },
        { name = "async_path" },
        { name = "async_path" },
        { name = "copilot" },
      }
    }
  }
}
