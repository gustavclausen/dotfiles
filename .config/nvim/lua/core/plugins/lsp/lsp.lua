local nvim_lsp = require("lspconfig")
local utils = require("core.plugins.lsp.utils")
local languages = require("core.plugins.lsp.languages")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

local servers = {
  "bashls",
  "dockerls",
  "jsonls",
  "marksman",
  "lua_ls",
  "terraformls",
  "yamlls",
  "dagger",
  "gopls",
  "tsserver",
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
      json = languages.json,
      yaml = languages.yaml,
    },
  })
end
