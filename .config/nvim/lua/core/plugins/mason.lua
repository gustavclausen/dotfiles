local settings = require("core.settings")

local M = {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
}

function M.config()
  require("mason").setup({})
  require("mason-lspconfig").setup({})
  require("mason-tool-installer").setup({
    ensure_installed = settings.mason_tool_installer_ensure_installed,
    start_delay = 3000,
  })
end

return M
