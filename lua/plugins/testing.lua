return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter"
    }
  },
  {
    "andythigpen/nvim-coverage",
    version = "*",
    dependencies = {
      "nvim-neotest/neotest",
      "nivm-lua/plenary.nvim"
    },
    config = function ()
      require("coverage").setup({
        auto_reload = true,
        highlights = {
          covered = { fg = "#85b695" },
          partial = { fg = "#ebc06d" },
          uncovered = { fg = "#d47766" }
        },
        summary = {
          min_coverage = 80.0
        },
        lang = {
          java = {
            dir_prefix = "src/main/java",
            coverage_file = vim.fn.getcwd() .. "/target/site/jacoco/jacoco.xml"
          }
        }
      })
    end
  }
}
