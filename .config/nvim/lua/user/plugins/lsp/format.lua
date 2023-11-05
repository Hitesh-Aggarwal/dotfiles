local M = {}

local deny_list = {
  lua_ls = true,
  tsserver = true,
  jsonls = true,
  texlab = true,
  cssls = true,
}

M.format = function()
  vim.lsp.buf.format({
    filter = function(client)
      if deny_list[client.name] then
        return false
      else
        return true
      end
    end,
  })
end

return M
