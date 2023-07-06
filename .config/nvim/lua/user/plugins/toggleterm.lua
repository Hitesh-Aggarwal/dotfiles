return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      size = 20,
      open_mapping = [[<A-i>]],
      autochdir = true,
      hide_numbers = true,
      shade_terminals = true,
      shading_factor = 2,
      insert_mappings = false,
      direction = "horizontal",
    })
    local map = require("user.utils").map
    map("n", "<leader>rr", ":w<CR>:TermExec cmd='run_prog.sh %'<CR>")
  end,
}
