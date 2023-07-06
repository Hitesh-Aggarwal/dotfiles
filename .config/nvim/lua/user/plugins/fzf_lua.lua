return {
  "ibhagwan/fzf-lua",
  config = function()
    local fzf_lua = require("fzf-lua")
    local map = require("user.utils").map

    fzf_lua.register_ui_select()

    local opts = {
      previewer = false,
      git_icons = false,
      file_icons = false,
      fd_opts = "--color=never --type f --strip-cwd-prefix --hidden --exclude .git",
      rg_opts = "--color=never --files --hidden -g '!.git'",
    }

    fzf_lua.setup({
      winopts = {
        height = 0.55,
        width = 0.50,
        row = 0.45,
        col = 0.50,
      },
      files = opts,
      git = {
        files = opts,
      },
      oldfiles = opts,
      buffers = opts,
      grep = {
        git_icons = false,
        file_icons = false,
        winopts = {
          height = 0.85, -- window height
          width = 0.80, -- window width
          row = 0.35, -- window row position (0=top, 1=bottom)
          col = 0.50,
        },
      },
    })

    map("n", "<leader>fzf", require("fzf-lua").builtin)
    map("n", "<leader>ff", function()
      vim.fn.system("git rev-parse --is-inside-work-tree")
      if vim.v.shell_error == 0 then
        require("fzf-lua").git_files()
      else
        require("fzf-lua").files()
      end
    end)
    map("n", "<leader>fr", require("fzf-lua").live_grep)
    map("n", "<leader>fb", require("fzf-lua").buffers)
    map("n", "<leader>fo", require("fzf-lua").oldfiles)
    map("n", "<leader>fh", require("fzf-lua").help_tags)
  end,
}
