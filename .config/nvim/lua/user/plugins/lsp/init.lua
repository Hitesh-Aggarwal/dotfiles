return {
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "williamboman/mason.nvim",
      "folke/neodev.nvim",
      "hrsh7th/cmp-nvim-lsp",
      { "creativenull/efmls-configs-nvim", version = "v1.x.x" },
    },
    config = function()
      require("user.plugins.lsp.diagnostics")
      local mason = require("mason-lspconfig")
      require("mason").setup()
      require("neodev").setup()
      local stylua = require("efmls-configs.formatters.stylua")
      local pretter_d = require("efmls-configs.formatters.prettier_d")
      local black = require("efmls-configs.formatters.black")
      local languages = {
        lua = { stylua },
        html = { pretter_d },
        css = { pretter_d },
        javascript = { pretter_d },
        typescript = { pretter_d },
        python = { black },
      }

      local efmls_config = {
        filetypes = vim.tbl_keys(languages),
        settings = {
          rootMarkers = { ".git/" },
          languages = languages,
        },
        init_options = {
          documentFormatting = true,
          documentRangeFormatting = true,
        },
      }
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
        ["efm"] = function()
          require("lspconfig").efm.setup(vim.tbl_extend("force", efmls_config, {
            -- Pass your custom lsp config below like on_attach and capabilities
            --
            capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
          }))
        end,
      })
    end,
  },
}
