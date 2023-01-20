local M = {
  "glepnir/dashboard-nvim",
}

function M.config()
  local dashboard = require("dashboard")

  dashboard.custom_header = {
    "",
    "༼ つ ▀_▀ ༽つ",
    "",
    " Let's go!  ",
    "",
  }
  dashboard.custom_center = {
    {
      icon = "  ",
      desc = "New buffer               ",
      action = "new",
    },
    {

      icon = "  ",
      desc = "Find file                ",
      action = "Telescope find_files find_command=rg,--hidden,--files",
    },
    {
      icon = "  ",
      desc = "Recently opened files    ",
      action = "Telescope oldfiles",
    },
  }
  dashboard.custom_footer = nil
end

return M
