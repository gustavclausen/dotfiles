local M = {
  "glepnir/lspsaga.nvim",
}

function M.config()
  require("core.plugins.lsp.lspsaga")
end

return M
