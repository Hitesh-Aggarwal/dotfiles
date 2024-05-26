return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "https://gitlab.com/HiPhish/rainbow-delimiters.nvim",
    },
    build = function() require("nvim-treesitter.install").update({ with_sync = true }) end,
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
