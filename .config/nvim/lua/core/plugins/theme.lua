local settings = require("core.settings")

if settings.theme == "catppuccin" then
  return {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
      require("core.plugins.themes.catppuccin")
    end,
  }
else
  return {}
end
