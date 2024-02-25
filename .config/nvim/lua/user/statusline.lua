local set_hl = vim.api.nvim_set_hl

local get_hl = function(group)
  local status_ok, hl = pcall(vim.api.nvim_get_hl, 0, { name = group, link = false })
  return status_ok and hl or false
end

local format = function(arg) return "#" .. string.format("%06x", arg) end

local giv_color = function(group, type)
  local col = get_hl(group)
  if not col then return false end
  local val = col[type or "fg"]
  return val and format(val) or false
end

local used_theme = {
  Color1 = giv_color("CursorLine", "bg"), -- used as background of statusline
  Color2 = giv_color("Normal"), -- used for current location
  Color3 = giv_color("DiagnosticError"), -- used for errors
  Color4 = giv_color("DiagnosticWarn"), -- used for warnings
  Color5 = giv_color("DiagnosticHint"), -- used for hints
  Color6 = giv_color("DiagnosticInfo"), -- used for info and git branch
  Color7 = giv_color("GitSignsAdd"), -- used for git_added
  Color8 = giv_color("GitSignsChange"), -- used for git_change
  Color9 = giv_color("GitSignsDelete"), -- used for git_delete
  Color10 = giv_color("Special"), -- used for lsp names
  Color11 = giv_color("Number"), -- used for filetype
  Color12 = giv_color("Title"), -- used for side decoration
}

local function set_highlights()
  for i = 1, 11, 1 do
    set_hl(0, "User" .. i, {
      fg = used_theme["Color" .. i],
      bg = used_theme.Color1,
    })
  end
  set_hl(0, "User12", {
    fg = used_theme.Color12,
    bg = used_theme.Color12,
  })
end

set_highlights()

local function lsp()
  local count = {}
  local levels = {
    errors = "Error",
    warnings = "Warn",
    info = "Info",
    hints = "Hint",
  }

  for k, level in pairs(levels) do
    count[k] = vim.tbl_count(vim.diagnostic.get(0, { severity = level }))
  end

  local errors = ""
  local warnings = ""
  local hints = ""
  local info = ""

  if count["errors"] ~= 0 then errors = " %#User3# " .. count["errors"] end
  if count["warnings"] ~= 0 then warnings = " %#User4# " .. count["warnings"] end
  if count["hints"] ~= 0 then hints = " %#User5# " .. count["hints"] end
  if count["info"] ~= 0 then info = " %#User6#  " .. count["info"] end

  return errors .. warnings .. hints .. info
end

local function lsp_names()
  local names = {}
  for _, server in pairs(vim.lsp.get_active_clients({ bufnr = 0 })) do
    table.insert(names, server.name)
  end

  return "%#User10# [" .. table.concat(names, " ") .. "]"
end

local function filetype() return "%#User11#" .. string.format("%s", vim.bo.filetype) end

local function fileicon()
  local filename = vim.api.nvim_buf_get_name(0)
  local extension = vim.fn.fnamemodify(filename, ":e")
  local icon = require("nvim-web-devicons").get_icon_color(filename, extension, { default = true })
  return "%#User11#" .. icon .. " "
end

local function lineinfo()
  if vim.bo.filetype == "alpha" then return "" end
  return "%#User2#%l:%c"
end

local vcs = function()
  local git_info = vim.b.gitsigns_status_dict
  if not git_info or git_info.head == "" then return "" end
  local added = git_info.added and ("%#User3#+" .. git_info.added .. " ") or ""
  local changed = git_info.changed and ("%#User2#~" .. git_info.changed .. " ") or ""
  local removed = git_info.removed and ("%#User7#-" .. git_info.removed .. " ") or ""
  if git_info.added == 0 then added = "" end
  if git_info.changed == 0 then changed = "" end
  if git_info.removed == 0 then removed = "" end
  return table.concat({
    "%#User6# ",
    git_info.head,
    " ",
    added,
    changed,
    removed,
  })
end

local space = function() return "%#User1#  " end

local align = function() return "%#User1#%=" end

local ends = function() return "%#User12# " end

Statusline = {}

Statusline.active = function()
  return table.concat({
    ends(),
    space(),
    vcs(),
    align(),
    lsp(),
    align(),
    lsp_names(),
    space(),
    fileicon(),
    filetype(),
    space(),
    lineinfo(),
    space(),
    ends(),
  })
end

function Statusline.inactive() return " %F" end

local group = vim.api.nvim_create_augroup("Statusline", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter", "WinEnter" }, {
  group = group,
  pattern = "*",
  command = "setlocal statusline=%!v:lua.Statusline.active()",
})

vim.api.nvim_create_autocmd({ "BufLeave", "WinLeave" }, {
  group = group,
  pattern = "*",
  command = "setlocal statusline=%!v:lua.Statusline.inactive()",
})
