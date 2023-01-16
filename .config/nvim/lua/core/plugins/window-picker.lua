local M = {
  "s1n7ax/nvim-window-picker",
}

function M.config()
  require("window-picker").setup({
    include_current_win = false,
  })
end

return M
