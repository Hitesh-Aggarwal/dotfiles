local signs = {
  { name = "DiagnosticSignError", text = " " },
  { name = "DiagnosticSignWarn", text = " " },
  { name = "DiagnosticSignHint", text = "" },
  { name = "DiagnosticSignInfo", text = " " },
}

for _, sign in ipairs(signs) do
  vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

local config = {
  -- show signs
  signs = {
    active = signs,
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

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "rounded",
  width = 60,
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = "rounded",
  width = 60,
})

local map = require("user.utils").map
map("n", "gD", vim.lsp.buf.declaration)
map("n", "gd", vim.lsp.buf.definition)
map("n", "K", vim.lsp.buf.hover)
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
map("n", "[d", vim.diagnostic.goto_prev)
map("n", "]d", vim.diagnostic.goto_next)
