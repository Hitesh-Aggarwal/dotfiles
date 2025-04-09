local config = {
  -- show signs
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = " ",
      [vim.diagnostic.severity.WARN] = " ",
      [vim.diagnostic.severity.HINT] = "",
      [vim.diagnostic.severity.INFO] = " ",
    },
  },
  update_in_insert = false,
  underline = true,
  severity_sort = true,
  float = {
    focusable = false,
    style = "minimal",
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  },
}

vim.diagnostic.config(config)

local map = require("user.utils").map
map("n", "gD", vim.lsp.buf.declaration)
map("n", "gd", vim.lsp.buf.definition)
map("n", "K", function() vim.lsp.buf.hover({ border = "rounded" }) end)
map("n", "gi", vim.lsp.buf.implementation)
map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder)
map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder)
map("n", "<leader>wl", function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end)
map("n", "<leader>D", vim.lsp.buf.type_definition)
map("n", "<leader>rn", vim.lsp.buf.rename)
map("n", "<leader>ca", vim.lsp.buf.code_action)
map("n", "gr", vim.lsp.buf.references)
-- map("n", "<leader>fc", require("user.plugins.lsp.format").format)
map("n", "<leader>de", vim.diagnostic.open_float)
map("n", "[d", function() vim.diagnostic.jump({ count = -1 }) end)
map("n", "]d", function() vim.diagnostic.jump({ count = -1 }) end)
