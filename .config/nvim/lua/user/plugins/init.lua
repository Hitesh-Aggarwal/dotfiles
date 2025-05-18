return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function() vim.cmd.colorscheme("catppuccin-mocha") end,
  },
  {
    "windwp/nvim-autopairs",
    config = true,
  },
  {
    "numToStr/Comment.nvim",
    config = true,
  },
  {
    "lewis6991/gitsigns.nvim",
    config = true,
  },
  "jghauser/mkdir.nvim",
}
