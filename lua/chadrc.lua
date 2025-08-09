-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "melange",
  changed_themes = {
    melange = {
      base_16 = {
        base00 = "#292522",
        base01 = "#34302C",
        base02 = "#403A36",
        base03 = "#867462",
        base04 = "#C1A78E",
        base05 = "#ECE1D7",
        base06 = "#ECE1D7",
        base07 = "#C1A78E",
        base08 = "#ECE1D7",
        base09 = "#CF9BC2",
        base0A = "#7B9695",
        base0B = "#A3A9CE",
        base0C = "#7F91B2",
        base0D = "#EBC06D",
        base0E = "#B380B0",
        base0F = "#8B7449",
      },
      polish_hl = {
        treesitter = {
          ["@lsp.type.modifier"] = {
            fg = "#E49B5D"
          }, 
          ["@keyword.import"] = {
            fg = "#E49B5D"
          }, 
          ["@attribute"] = {
            fg = "#85B695",
          }, 
          ["@keyword"] = {
            fg = "#E49B5D"
          }, 
          ["@keyword.function"] = {
            fg = "#85B695"
          }, 
          ["@keyword.conditional"] = {
            fg = "#E49B5D"
          }, 
          ["@keyword.return"] = {
            fg = "#E49B5D"
          }, 
          ["@keyword.operator"] = {
            fg = "#E49B5D"
          }, 
          ["@operator"] = {
            fg = "#D47766"
          }, 
          ["@punctuation.delimiter"] = {
            fg = "#BD8183"
          }, 
          ["@constructor"] = {
            fg = "#EBC06D"
          }, 
          ["@lsp.type.enumMember"] = {
            fg = "#ECE1D7"
          }, 
        }
      }
    }
  },
  hl_override = {
    Include = { fg = "#E49B5D" },
    Comment = { italic = true },
  },
}

-- M.nvdash = { load_on_startup = true }
-- M.ui = {
--       tabufline = {
--          lazyload = false
--      }
-- }

return M
