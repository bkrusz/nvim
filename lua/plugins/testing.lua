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
    "mfussenegger/nvim-dap",
    config = function()
      local status_ok, dap = pcall(require, "dap")
      if not status_ok then
        return
      end

      vim.fn.sign_define("DapBreakpoint", { text = " ", texthl = "DiagnosticSignError", linehl = "", numhl = "" })
      vim.fn.sign_define("DapBreakpointRejected", { text = " ", texthl = "DiagnosticSignError", linehl = "", numhl = "" })
      vim.fn.sign_define("DapStopped", { text = " ", texthl = "DiagnosticSignWarn", linehl = "Visual", numhl = "DiagnosticSignWarn" })

      dap.set_log_level("info")
    end,
    lazy = true,
    dependencies = {
      "rcarriga/nvim-dap-ui",
    },
    enabled = true,
  },

  -- Debugger user interface
  {
    "rcarriga/nvim-dap-ui",
    config = function()
      local status_ok, dap = pcall(require, "dap")
      if not status_ok then
        return
      end
      local dapui = require("dapui")
      dapui.setup({
        icons = { expanded = " ", collapsed = "", circular = " " },
        mappings = {
          -- Use a table to apply multiple mappings
          expand = { "<CR>", "<2-LeftMouse>" },
          open = "o",
          remove = "d",
          edit = "e",
          repl = "r",
          toggle = "t",
        },
        -- Use this to override mappings for specific elements
        element_mappings = {},
        expand_lines = true,
        layouts = {
          {
            elements = {
              { id = "scopes", size = 0.33 },
              { id = "breakpoints", size = 0.17 },
              { id = "stacks", size = 0.25 },
              { id = "watches", size = 0.25 },
            },
            size = 0.33,
            position = "right",
          },
          {
            elements = {
              { id = "repl", size = 0.45 },
              { id = "console", size = 0.55 },
            },
            size = 0.27,
            position = "bottom",
          },
        },
        controls = {
          enabled = true,
          -- Display controls in this element
          element = "repl",
          icons = {
            pause = "",
            play = "",
            step_into = "",
            step_over = "",
            step_out = "",
            step_back = "",
            run_last = "",
            terminate = "",
          },
        },
        floating = {
          max_height = 0.9,
          max_width = 0.5, -- Floats will be treated as percentage of your screen.
          border = "rounded",
          mappings = {
            close = { "q", "<Esc>" },
          },
        },
        windows = { indent = 1 },
        render = {
          max_type_length = nil, -- Can be integer or nil.
          max_value_lines = 100, -- Can be integer or nil.
        },
      })

      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end

      local levels = {
        TRACE = 1,
        DEBUG = 2,
        INFO = 3,
        WARN = 4,
        ERROR = 5,
      }

      -- until rcarriga/nvim-dap-ui#164 is fixed
      local function notify_handler(msg, level, opts)
        if level >= vim.log.levels.INFO then
          return vim.notify(msg, level, opts)
        end

        opts = vim.tbl_extend("keep", opts or {}, {
          title = "dap-ui",
          icon = "",
          on_open = function(win)
            vim.api.nvim_set_option_value("filetype", "markdown", { buf = vim.api.nvim_win_get_buf(win) })
          end,
        })

        -- vim_log_level can be omitted
        if level == nil then
          level = levels["INFO"]
        elseif type(level) == "string" then
          level = levels[(level):upper()] or levels["INFO"]
        else
          -- https://github.com/neovim/neovim/blob/685cf398130c61c158401b992a1893c2405cd7d2/runtime/lua/vim/lsp/log.lua#L5
          level = level + 1
        end

        msg = string.format("%s: %s", opts.title, msg)
        Log:add_entry(level, msg)
      end

      local dapui_ok, _ = xpcall(function()
        require("dapui.util").notify = notify_handler
      end, debug.traceback)
    end,
    lazy = true,
    enabled = true,
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
