return {
  {
    "olimorris/onedarkpro.nvim",
    priority = 1000, -- Ensure it loads first
    config = function()
      require("onedarkpro").setup({
        options = {
          cursorline = true,
        },
      })
      vim.cmd.colorscheme("onedark")
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = true,
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
