local M = {
  "ahmedkhalf/project.nvim",
  config = function()
    require("project_nvim").setup({
      manual_mode = true,
      patterns = {
        ".git",
        "package.json",
        ".terraform",
        "go.mod",
        "requirements.yml",
        "pyrightconfig.json",
        "pyproject.toml",
      },
      detection_methods = { "pattern" },
      scope_chdir = "tab",
    })
  end,
}

return M
