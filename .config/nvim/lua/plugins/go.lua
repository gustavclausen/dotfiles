local setup, go = pcall(require, "go")
if not setup then
  return
end

-- local augroup = vim.api.nvim_create_augroup("GoFormat", {})

go.setup({
  lsp_cfg = true,
  lsp_gofumpt = false,
  lsp_codelens = false,
  lsp_keymaps = false,
  lsp_document_formatting = true,
  lsp_inlay_hints = {
    enabled = false,
    only_current_line = true,
  },
})
