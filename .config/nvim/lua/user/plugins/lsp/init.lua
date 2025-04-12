return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    require("user.plugins.lsp.diagnostics")
    require("mason").setup()
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    local servers = { "basedpyright", "rust_analyzer" }
    for _, lsp in ipairs(servers) do
      require("lspconfig")[lsp].setup({
        capabilities = capabilities,
      })
    end
    require("lspconfig").lua_ls.setup({
      capabilities = capabilities,
      on_init = function(client)
        local path = client.workspace_folders[1].name
        if vim.loop.fs_stat(path .. "/.luarc.json") or vim.loop.fs_stat(path .. "/.luarc.jsonc") then return end

        client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
          runtime = {
            version = "LuaJIT",
          },
          workspace = {
            checkThirdParty = false,
            library = {
              vim.env.VIMRUNTIME,
              "${3rd}/luv/library",
            },
          },
        })
      end,
      settings = {
        Lua = {},
      },
    })
  end,
}
