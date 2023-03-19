local M = {}

M.theme = "catppuccin"

M.treesitter_ensure_installed = {
  "bash",
  "dockerfile",
  "go",
  "hcl",
  "json",
  "lua",
  "markdown",
  "markdown_inline",
  "toml",
  "vim",
  "yaml",
  "cue",
}
M.mason_tool_installer_ensure_installed = {
  "bash-language-server",
  "dockerfile-language-server",
  "json-lsp",
  "marksman",
  "lua-language-server",
  "terraform-ls",
  "yaml-language-server",
  "cuelsp",
  -- Formatter
  "prettier",
  "stylua",
  "cueimports",
  -- Linter
  "eslint_d",
  "shellcheck",
  "tflint",
  "yamllint",
  "shfmt",
}

return M
