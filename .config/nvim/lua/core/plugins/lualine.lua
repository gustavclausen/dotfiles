local M = {
  "nvim-lualine/lualine.nvim",
}

function M.config()
  require("lualine").setup({
    sections = {
      lualine_c = {
        {
          "filename",
          file_status = true,
          path = 1,
        },
      },
    },
  })
end

return M
