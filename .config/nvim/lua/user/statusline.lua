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
  Color0 = giv_color("CursorLine", "bg"), -- used as background of statusline
  Color1 = giv_color("Normal"), -- used for current location
  Color2 = giv_color("@constructor"), -- used for git branch
  Color3 = giv_color("GitSignsAdd"), -- used for git_added
  Color4 = giv_color("GitSignsChange"), -- used for git_change
  Color5 = giv_color("GitSignsDelete"), -- used for git_delete
  Color6 = giv_color("Number"), -- used for filetype
  Color7 = giv_color("Title"), -- used for side decoration
}

local function set_highlights()
  for i = 0, 6, 1 do
    set_hl(0, "User" .. i, {
      fg = used_theme["Color" .. i],
      bg = used_theme.Color0,
    })
  end
  set_hl(0, "User7", {
    fg = used_theme.Color7,
    bg = used_theme.Color7,
  })
end

set_highlights()

local function filetype() return "%#User6#" .. string.format("%s", vim.bo.filetype) end

local function lineinfo()
  if vim.bo.filetype == "alpha" then return "" end
  return "%#User1#%l:%c"
end

local vcs = function()
  local git_info = vim.b.gitsigns_status_dict
  if not git_info or git_info.head == "" then return "" end
  local added = git_info.added and ("%#User3#+" .. git_info.added .. " ") or ""
  local changed = git_info.changed and ("%#User4#~" .. git_info.changed .. " ") or ""
  local removed = git_info.removed and ("%#User5#-" .. git_info.removed .. " ") or ""
  if git_info.added == 0 then added = "" end
  if git_info.changed == 0 then changed = "" end
  if git_info.removed == 0 then removed = "" end
  return table.concat({
    "%#User2# ",
    git_info.head,
    " ",
    added,
    changed,
    removed,
  })
end

local space = function() return "%#User0#  " end

local align = function() return "%#User0#%=" end

local ends = function() return "%#User7# " end

Statusline = {}

Statusline.active = function()
  return table.concat({
    ends(),
    space(),
    vcs(),
    align(),
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
