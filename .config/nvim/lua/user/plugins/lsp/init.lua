return {
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "williamboman/mason.nvim",
      "folke/neodev.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      require("user.plugins.lsp.diagnostics")
      local mason = require("mason-lspconfig")
      require("mason").setup()
      require("neodev").setup()
      mason.setup({
        ensure_installed = { "lua_ls" },
      })
      mason.setup_handlers({
        function(server_name) -- default handler (optional)
          require("lspconfig")[server_name].setup({
            capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
            single_file_support = true,
          })
        end,
        -- Next, you can provide targeted overrides for specific servers.
        -- For example, a handler override for the `rust_analyzer`:
        -- ["rust_analyzer"] = function()
        -- 	require("rust-tools").setup({})
        -- end,
      })
    end,
  },
  {
    "jay-babu/mason-null-ls.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "jose-elias-alvarez/null-ls.nvim",
    },
    config = function()
      require("null-ls").setup({})
      require("mason-null-ls").setup({
        ensure_installed = { "stylua" },
        automatic_installation = true,
        handlers = {},
      })
    end,
  },
}
