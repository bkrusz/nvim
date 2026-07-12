local status, jdtls = pcall(require, "jdtls")
if not status then
  return
end

-- Setup Workspace
local home = os.getenv("HOME")
local workspace_path = home .. "/.local/share/nvim/jdtls-workspace/"
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = workspace_path .. project_name

-- Determine OS
local os_config = "linux"
if vim.fn.has "mac" == 1 then
  os_config = "mac"
end

-- Setup Capabilities
local capabilities = nil
local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if status_ok then
  capabilities = cmp_nvim_lsp.default_capabilities()
end

if capabilities == nil then
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  }
end

local extendedClientCapabilities = jdtls.extendedClientCapabilities
extendedClientCapabilities.resolveAdditionalTextEditsSupport = true

-- Setup Testing and Debugging
local bundles = {}
local mason_path = vim.fn.glob(vim.fn.stdpath "data" .. "/mason/")
vim.list_extend(bundles, vim.split(vim.fn.glob(mason_path .. "packages/java-test/extension/server/*.jar"), "\n"))
vim.list_extend(
  bundles,
  vim.split(
    vim.fn.glob(mason_path .. "packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar"),
    "\n"
  )
)

local config = {
  cmd = {
    "java",
    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.protocol=true",
    "-Dlog.level=ALL",
    "-Xms1g",
    "--add-modules=ALL-SYSTEM",
    "--add-opens",
    "java.base/java.util=ALL-UNNAMED",
    "--add-opens",
    "java.base/java.lang=ALL-UNNAMED",
    "-javaagent:" .. home .. "/.local/share/nvim/mason/packages/jdtls/lombok.jar",
    "-jar",
    vim.fn.glob(home .. "/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar"),
    "-configuration",
    home .. "/.local/share/nvim/mason/packages/jdtls/config_" .. os_config,
    "-data",
    workspace_dir,
  },
  root_dir = require("jdtls.setup").find_root { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" },
  capabilities = capabilities,

  settings = {
    java = {
      eclipse = {
        downloadSources = true,
      },
      configuration = {
        updateBuildConfiguration = "interactive",
        runtimes = {
          {
            name = "JavaSE-25",
            path = "/Library/Java/JavaVirtualMachines/zulu-25.jdk/Contents/Home",
          },
        },
      },
      maven = {
        downloadSources = true,
      },
      implementationsCodeLens = {
        enabled = true,
      },
      referencesCodeLens = {
        enabled = true,
      },
      references = {
        includeDecompiledSources = true,
      },
      inlayHints = {
        parameterNames = {
          enabled = "all", -- literals, all, none
        },
      },
      format = {
        enabled = false,
      },
    },
    signatureHelp = { enabled = true },
    extendedClientCapabilities = extendedClientCapabilities,
  },
  init_options = {
    bundles = bundles,
  },
}

local function setup_document_highlight(client, bufnr)
  local status_ok, highlight_supported = pcall(function()
    return client.supports_method "textDocument/documentHighlight"
  end)
  if not status_ok or not highlight_supported then
    return
  end
  local group = "lsp_document_highlight"
  local hl_events = { "CursorHold", "CursorHoldI" }

  local ok, hl_autocmds = pcall(vim.api.nvim_get_autocmds, {
    group = group,
    buffer = bufnr,
    event = hl_events,
  })

  if ok and #hl_autocmds > 0 then
    return
  end

  vim.api.nvim_create_augroup(group, { clear = false })
  vim.api.nvim_create_autocmd(hl_events, {
    group = group,
    buffer = bufnr,
    callback = vim.lsp.buf.document_highlight,
  })
  vim.api.nvim_create_autocmd("CursorMoved", {
    group = group,
    buffer = bufnr,
    callback = vim.lsp.buf.clear_references,
  })
end

local function setup_codelens_refresh(client, bufnr)
  local status_ok, codelens_supported = pcall(function()
    return client:supports_method "textDocument/codeLens"
  end)
  if not status_ok or not codelens_supported then
    return
  end
  local group = "lsp_code_lens_refresh"
  local cl_events = { "BufEnter", "InsertLeave" }
  local ok, cl_autocmds = pcall(vim.api.nvim_get_autocmds, {
    group = group,
    buffer = bufnr,
    event = cl_events,
  })

  if ok and #cl_autocmds > 0 then
    return
  end
  vim.api.nvim_create_augroup(group, { clear = false })
  vim.api.nvim_create_autocmd(cl_events, {
    group = group,
    buffer = bufnr,
    callback = function()
      vim.lsp.codelens.enable(true, { bufnr = bufnr })
    end,
  })
end

local function setup_document_symbols(client, bufnr)
  vim.g.navic_silence = false -- can be set to true to suppress error
  local symbols_supported = client:supports_method "textDocument/documentSymbol"
  if not symbols_supported then
    Log:debug("skipping setup for document_symbols, method not supported by " .. client.name)
    return
  end
  local status_ok, navic = pcall(require, "nvim-navic")
  if status_ok then
    navic.attach(client, bufnr)
  end
end

config["on_attach"] = function(client, bufnr)
  local _, _ = pcall(vim.lsp.codelens.refresh)
	require("jdtls").setup_dap({ hotcodereplace = "auto" })
  setup_document_highlight(client, bufnr)
  setup_codelens_refresh(client, bufnr)
  setup_document_symbols(client, bufnr)
  local status_ok, jdtls_dap = pcall(require, "jdtls.dap")
  if status_ok then
    jdtls_dap.setup_dap_main_class_configs()
  end
end

require('dap.ext.vscode').load_launchjs()

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  pattern = { "*.java" },
  callback = function()
    local _, _ = pcall(vim.lsp.codelens.refresh)
  end,
})

require("jdtls").start_or_attach(config)

Global_jdtls = require("jdtls")

function Organize_imports_save_and_close()
  Global_jdtls.organize_imports()
  vim.cmd("update")
  vim.cmd("bd")
end

function Expand_wildcard_imports()
  vim.cmd.vimgrep({ args = { "/import .*.\\*;/ **/*.java" } })
  vim.cmd.cfdo({ args = { "lua Organize_imports_save_and_close()" } })
end

local map = vim.keymap.set
local wk = require("which-key")

wk.add({ "<leader>l", group = "Java", icon = { icon = " ", color = "red" } })
map("n", "<leader>lo", "<cmd>lua require('jdtls').organize_imports()<cr>", { desc = "Organize imports" })
map("n", "<leader>lv", "<cmd>lua require('jdtls').extract_variable()<cr>", { desc = "Extract variable" })
map("n", "<leader>lc", "<cmd>lua require('jdtls').extract_constant()<cr>", { desc = "Extract constant" })
map("n", "<leader>lg", "<cmd>lua vim.lsp.buf.code_action({filter=function (code_action) return code_action.title == 'Generate Getters and Setters' end,apply=true})", { desc = "Add getters and setters" })
map("n", "<leader>lt", "<cmd>lua require('jdtls').test_nearest_method()<cr>", { desc = "Test method" })
map("n", "<leader>lT", "<cmd>lua require('jdtls').test_class()<cr>", { desc = "Test class" })
map("n", "<leader>ld", "<cmd>FloatermNew JAVA_HOME=$(/usr/libexec/java_home -v 17) mvn dependency:resolve<cr>", { desc = "Resolve dependencies" })
map("n", "<leader>li", "<cmd>FloatermNew JAVA_HOME=$(/usr/libexec/java_home -v 17) mvn clean install<cr>", { desc = "Maven clean install" })
map("n", "<leader>lp", "<cmd>FloatermNew JAVA_HOME=$(/usr/libexec/java_home -v 17) mvn clean package<cr>", { desc = "Maven clean package" })
map("n", "<leader>lr", "<cmd>FloatermNew JAVA_HOME=$(/usr/libexec/java_home -v 17) mvn spring-boot:run<cr>", { desc = "Run spring boot app" })
map("n", "<leader>le", "<cmd>lua Expand_wildcard_imports()<cr>", { desc = "Expand wildcard imports" })
map("n", "<leader>lu", "<cmd>JdtUpdateConfig<cr>", { desc = "Update config" })
map("v", "<leader>lv", "<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>", { desc = "Extract Variable" })
map("v", "<leader>lc", "<Esc><Cmd>lua require('jdtls').extract_constant(true)<CR>", { desc = "Extract Constant" })
map("v", "<leader>lm", "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>", { desc = "Extract Method" })

map("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", { desc ="Show hover" })
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", { desc ="Goto definition" })
map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", { desc ="Goto declaration" })
map("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", { desc ="Goto references" })
map("n", "gI", "<cmd>lua vim.lsp.buf.implementation()<cr>", { desc ="Goto implementation" })
map("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", { desc ="Goto signature_help" })
map("n", "gt", "<cmd>lua require('jdtls.tests').goto_subjects()<cr>", { desc ="Goto tests" })
map("n", "gl", function()
                  local float = vim.diagnostic.config().float

                  if float then
                    local config = type(float) == "table" and float or {}
                    config.scope = "line"

                    vim.diagnostic.open_float(config)
                  end
                end, { desc ="Goto signature_help" })

