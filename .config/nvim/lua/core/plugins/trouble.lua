local M = {
  "folke/trouble.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "folke/lsp-colors.nvim",
  },
}

function M.config()
  require("lsp-colors").setup()
  require("trouble").setup()
end

return M
