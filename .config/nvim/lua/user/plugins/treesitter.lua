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
      sync_install = false,
      highlight = {
        enable = true,
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "gnn", -- set to `false` to disable one of the mappings
          node_incremental = "grn",
          scope_incremental = "grc",
          node_decremental = "grm",
        },
      },
    })
  end,
}
