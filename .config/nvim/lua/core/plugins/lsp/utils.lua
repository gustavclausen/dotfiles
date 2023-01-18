M = {}

AUTOFORMAT_ACTIVE = true
-- toggle null-ls's autoformatting
M.toggle_autoformat = function()
  AUTOFORMAT_ACTIVE = not AUTOFORMAT_ACTIVE
  require("core.utils.functions").notify(
    string.format("Autoformatting %s", AUTOFORMAT_ACTIVE and "on" or "off"),
    1,
    "lsp.utils"
  )
end

function M.custom_lsp_attach(client, bufnr)
  local wk = require("which-key")
  local default_options = { silent = true, noremap = true, buffer = bufnr }

  -- handled by null-ls
  client.server_capabilities.documentFormattingProvider = false
  client.server_capabilities.documentRangeFormattingProvider = false

  wk.register({
    l = {
      name = "LSP",
      a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code action" },
      d = { "<cmd>Telescope lsp_definitions<cr>", "Go to definition" },
      D = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "Go to declaration" },
      e = { "<cmd>Telescope diagnostics bufnr=0<cr>", "Diagnostics" },
      k = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Hover commands" },
      i = {
        "<cmd>Telescope lsp_implementations<cr>",
        "Show implementations",
      },
      r = { "<cmd>Telescope lsp_references<cr>", "References" },
      R = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
      l = { "<cmd>lua vim.diagnostic.open_float()<CR>", "Line diagnostics" },
      n = { "<cmd>lua vim.diagnostic.goto_next()<cr>", "Next diagnostic" },
      p = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", "Prev diagnostic" },
      q = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Quickfix diagnostics" },
      t = { "<cmd>Telescope lsp_type_definitions<cr>", "Type definition" },
    },
  }, { prefix = "<leader>", mode = "n", default_options })
end

return M
