return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function() vim.cmd.colorschem("catppuccin-macchiato") end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("indent_blankline").setup({
        show_current_context = true,
        show_current_context_start = true,
      })
    end,
  },
  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    opts = {
      show_modified = true,
    },
  },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({
        "*",
        css = { css = true },
        html = { css = true },
        javascript = { css = true },
      })
    end,
  },
  {
    "mbbill/undotree",
    config = function()
      local map = require("user.utils").map
      map("n", "<leader>ut", "<cmd>UndotreeToggle<CR>")
    end,
  },
}
