return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = "BufReadPost",
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
  config = function()
    local settings = require("core.settings")

    require("nvim-treesitter.configs").setup({
      ensure_installed = settings.treesitter_ensure_installed,
      highlight = {
        enable = true,
      },
      indent = { enable = true },
      autotag = { enable = true },
      auto_install = true,
    })

    require("nvim-ts-autotag").setup()
  end,
}
