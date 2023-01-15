local M = {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
}

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

function M.config()
  require("nvim-tree").setup({
    open_on_setup = true,
    renderer = {
      icons = {
        glyphs = {
          folder = {
            arrow_closed = "",
            arrow_open = "",
          },
        },
      },
    },
    view = {
      mappings = {
        list = {
          { key = { "<C-n>" }, action = "cd" },
        },
      },
    },
    filters = {
      custom = { "^.git$", "^.DS_Store$" },
    },
  })
end

vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])

return M
