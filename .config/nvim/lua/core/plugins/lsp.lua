return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "onsails/lspkind-nvim",
  },
  config = function()
    require("core.plugins.lsp.lsp")
  end,
}
