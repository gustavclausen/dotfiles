local M = {
  "echasnovski/mini.nvim",
}

function M.config()
  require("mini.surround").setup()
end

return M
