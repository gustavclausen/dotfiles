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
      a = { "<cmd>Lspsaga code_action<cr>", "Code action" },
      f = { "<cmd>Lspsaga lsp_finder<cr>", "LSP finder" },
      d = { "<cmd>Lspsaga peek_definition<cr>", "Peek definition" },
      D = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "Go to declaration" },
      i = {
        "<cmd>lua vim.lsp.buf.implementation()<cr>",
        "Show implementations",
      },
      r = {
        n = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
        r = { "<cmd>lua vim.lsp.buf.references()<cr>", "References" },
      },
      x = { "<cmd>LspRestart<cr>", "Restart language servers" },
      K = { "<cmd>Lspsaga hover_doc<cr>", "Hover documentation" },
    },
  }, { prefix = "<leader>", mode = "n", default_options })
end

return M
