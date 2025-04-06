return {
  "stevearc/conform.nvim",
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "black" },
        beancount = { "bean-format" },
        -- javascript = { "prettierd" },
        -- html = { "prettierd" },
        -- css = { "prettierd" },
        -- json = { "prettierd" },
        -- yaml = { "prettierd" },
      },

      format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 500,
        lsp_fallback = true,
      },
    })
  end,
}
