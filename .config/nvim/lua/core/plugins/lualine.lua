local M = {
  "nvim-lualine/lualine.nvim",
}

function M.config()
  require("lualine").setup({
    options = {
      disabled_filetypes = { "neo-tree" },
    },
    sections = {
      lualine_b = {},
      lualine_c = {
        {
          "filename",
          path = 1,
        },
      },
    },
  })
end

return M
