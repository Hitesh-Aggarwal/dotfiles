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
      local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
      mason.setup_handlers({
        function(server_name) -- default handler (optional)
          require("lspconfig")[server_name].setup({
            single_file_support = true,
            capabilities = capabilities,
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
}
