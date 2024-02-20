return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "windwp/nvim-ts-autotag",
    "https://gitlab.com/HiPhish/rainbow-delimiters.nvim",
  },
  build = function() require("nvim-treesitter.install").update({ with_sync = true }) end,
  config = function()
    require("nvim-treesitter.configs").setup({
      autotag = {
        enable = true,
      },
      ensure_installed = { "lua" },
      highlight = {
        enable = true,
      },
    })
  end,
}
