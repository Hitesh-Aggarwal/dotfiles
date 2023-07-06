return {
  {
    "Shatur/neovim-session-manager",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("session_manager").setup({
        autoload_mode = require("session_manager.config").AutoloadMode.CurrentDir,
      })
      local map = require("user.utils").map
      map("n", "<leader>sl", "<cmd>SessionManager load_session<CR>")
      map("n", "<leader>sd", "<cmd>SessionManager delete_session<CR>")
    end,
  },
}
