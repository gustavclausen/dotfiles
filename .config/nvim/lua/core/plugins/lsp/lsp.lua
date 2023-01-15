local nvim_lsp = require("lspconfig")
local utils = require("core.plugins.lsp.utils")
local languages = require("core.plugins.lsp.languages")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

local signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

local servers = {
  "bashls",
  "dockerls",
  "jsonls",
  "marksman",
  "sumneko_lua",
  "terraformls",
  "yamlls",
}

for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup({
    on_attach = function(client, bufnr)
      utils.custom_lsp_attach(client, bufnr)
    end,
    capabilities = capabilities,
    flags = { debounce_text_changes = 150 },
    settings = {
      Lua = languages.lua,
    },
  })
end