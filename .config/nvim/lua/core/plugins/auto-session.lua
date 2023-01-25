local M = {
  "rmagatti/auto-session",
}

function M.config()
  require("auto-session").setup({
    pre_save_cmds = {
      function()
        require("neo-tree.sources.manager").close_all()
      end,
    },
    bypass_session_save_file_types = { "neo-tree" },
    post_restore_cmds = {
      "NeoTreeReveal",
    },
    auto_session_suppress_dirs = { "~/", "/" },
  })
end

return M
