local M = {
  "folke/trouble.nvim",
  dependencies = {
    "folke/lsp-colors.nvim",
  },
}

function M.config()
  require("lsp-colors").setup()
  require("trouble").setup()
end

return M
