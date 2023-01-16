local M = {
  "nvim-telescope/telescope.nvim",
  version = "0.1.0",
  dependencies = {
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-ui-select.nvim",
  },
}

function M.config()
  local telescope = require("telescope")
  local actions = require("telescope.actions")

  telescope.setup({
    extensions = {
      require("telescope.themes").get_dropdown({}),
    },
    defaults = {
      file_ignore_patterns = { ".git/" },
      mappings = {
        i = {
          ["<C-k>"] = actions.move_selection_previous,
          ["<C-j>"] = actions.move_selection_next,
          ["<C-h>"] = "which_key",
        },
      },
    },
    pickers = {
      find_files = {
        hidden = true,
      },
    },
  })

  telescope.load_extension("fzf")
  telescope.load_extension("projects")
  telescope.load_extension("ui-select")
end

return M
