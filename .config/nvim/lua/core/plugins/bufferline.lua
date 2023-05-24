local M = {
  "akinsho/bufferline.nvim",
  version = "v3.*",
}

M.config = function()
  require("bufferline").setup({
    options = {
      offsets = {
        {
          filetype = "neo-tree",
          text = "File Explorer",
          highlight = "Directory",
          separator = true, -- use a "true" to enable the default, or set your own character
        },
      },
    },
  })

  vim.api.nvim_set_keymap("n", "<c-n>", "<cmd>BufferLineCycleNext<CR>", { noremap = true, silent = false })
  vim.api.nvim_set_keymap("n", "<c-p>", "<cmd>BufferLineCyclePrev<CR>", { noremap = true, silent = false })
  vim.api.nvim_set_keymap("n", "<c-q>", "<cmd>BufferLinePickClose<CR>", { noremap = true, silent = false })
end

return M
