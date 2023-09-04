-- autocommands
vim.api.nvim_create_autocmd("BufWritePre", {
  group = vim.api.nvim_create_augroup("Format_on_save", { clear = true }),
  pattern = "*",
  callback = require("user.plugins.lsp.format").format,
  desc = "Formats the file before saving",
})

vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("no_newline_comment", { clear = true }),
  pattern = "*",
  command = "setlocal formatoptions-=c formatoptions-=r formatoptions-=o",
  desc = "Disables automatic commenting on newline",
})

-- user command
vim.api.nvim_create_user_command("HeaderGates", function()
  local gatename = vim.fn.substitute(string.upper(vim.fn.expand("%:t")), "\\.", "_", "g")
  vim.api.nvim_buf_set_lines(0, 0, 0, false, { "#ifndef " .. gatename })
  vim.api.nvim_buf_set_lines(0, 1, 1, false, { "#define " .. gatename })
  vim.api.nvim_buf_set_lines(0, -1, -1, false, { "#endif /* " .. gatename .. " */" })
end, {})
