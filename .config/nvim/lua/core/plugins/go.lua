local M = {
  "ray-x/go.nvim",
  ft = "go",
}

function M.config()
  require("go").setup({
    lsp_cfg = true,
    lsp_keymaps = false,
    lsp_document_formatting = false, -- null-ls handles formatting
    lsp_codelens = false,
    lsp_inlay_hints = {
      enabled = false,
      only_current_line = true,
    },
    lsp_on_attach = function(client, bufnr)
      require("core.plugins.lsp.utils").custom_lsp_attach(client, bufnr)
    end,
  })
end

return M
