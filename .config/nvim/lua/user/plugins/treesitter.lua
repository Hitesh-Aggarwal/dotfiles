return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "https://gitlab.com/HiPhish/rainbow-delimiters.nvim",
    },
    build = ":TSUpdate",
    lazy = false,
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "lua" },
        highlight = {
          enable = true,
        },
      })
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    config = true,
  },
}
