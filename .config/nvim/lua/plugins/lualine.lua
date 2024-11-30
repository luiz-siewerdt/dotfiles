local colors = {
  bg_dark = "#1C1C2C", --
  bg = "#000000", --
  bg_highlight = "#2f334d", --
  terminal_black = "#444a73", --
  fg = "#c8d3f5", --
  fg_dark = "#828bb8", --
  fg_gutter = "#3b4261",
  dark3 = "#545c7e",
  comment = "#7a88cf", --
  dark5 = "#737aa2",
  blue0 = "#3e68d7", --
  blue = "#82aaff", --
  cyan = "#86e1fc", --
  blue1 = "#65bcff", --
  blue2 = "#0db9d7",
  blue5 = "#89ddff",
  blue6 = "#b4f9f8", --
  blue7 = "#394b70",
  purple = "#fca7ea", --
  magenta2 = "#ff007c",
  magenta = "#c099ff", --
  orange = "#ff966c", --
  yellow = "#ffc777", --
  green = "#c3e88d", --
  green1 = "#4fd6be", --
  green2 = "#41a6b5",
  teal = "#4fd6be", --
  red = "#ff757f", --
  red1 = "#c53b53", --
}

local theme = {
  normal = {
    a = { bg = colors.bg_dark, fg = colors.terminal_black },
    b = { bg = colors.fg_gutter, fg = colors.blue },
    c = { fg = colors.fg_sidebar },
    z = { fg = colors.blue7 },
  },
  insert = { a = { bg = colors.green, fg = colors.terminal_black } },
  visual = { { bg = colors.magenta, fg = colors.terminal_black } },
  replace = { a = { bg = colors.red, fg = colors.terminal_black } },
}

local empty = require("lualine.component"):extend()
function empty:draw(default_highlight)
  self.status = ""
  self.applied_separator = ""
  self:apply_highlights(default_highlight)
  self:apply_section_separators()
  return self.status
end

-- Put proper separators and gaps between components in sections
local function process_sections(sections)
  for name, section in pairs(sections) do
    local left = name:sub(9, 10) < "x"
    for pos = 1, name ~= "lualine_z" and #section or #section - 1 do
      table.insert(section, pos * 2, { empty, color = { fg = colors.white, bg = colors.white } })
    end
    for id, comp in ipairs(section) do
      if type(comp) ~= "table" then
        comp = { comp }
        section[id] = comp
      end
      comp.separator = left and { right = "" } or { left = "" }
    end
  end
  return sections
end

local function search_result()
  if vim.v.hlsearch == 0 then
    return ""
  end
  local last_search = vim.fn.getreg("/")
  if not last_search or last_search == "" then
    return ""
  end
  local searchcount = vim.fn.searchcount({ maxcount = 9999 })
  return last_search .. "(" .. searchcount.current .. "/" .. searchcount.total .. ")"
end

local function modified()
  if vim.bo.modified then
    return "+"
  elseif vim.bo.modifiable == false or vim.bo.readonly == true then
    return "-"
  end
  return ""
end

local options = {
  theme = theme,
  component_separators = "",
  section_separators = { left = "", right = "" },
}
local sections = process_sections({
  lualine_a = { "mode" },
  lualine_b = {
    "branch",
    "diff",
    {
      "diagnostics",
      source = { "nvim" },
      sections = { "error" },
      diagnostics_color = { error = { bg = colors.red, fg = colors.white } },
    },
    {
      "diagnostics",
      source = { "nvim" },
      sections = { "warn" },
      diagnostics_color = { warn = { bg = colors.orange, fg = colors.white } },
    },
    { "filename", file_status = false, path = 1 },
    { modified, color = { bg = colors.red } },
    {
      "%w",
      cond = function()
        return vim.wo.previewwindow
      end,
    },
    {
      "%r",
      cond = function()
        return vim.bo.readonly
      end,
    },
    {
      "%q",
      cond = function()
        return vim.bo.buftype == "quickfix"
      end,
    },
  },
  lualine_c = {},
  lualine_x = {},
  lualine_y = { search_result, "filetype" },
  lualine_z = { "%l:%c", "%p%%/%L" },
})

return {
  -- "nvim-lualine/lualine.nvim",
  -- event = "VeryLazy",
  -- opts = function(_, opts)
  --   local lualine_require = require("lualine_require")
  --   lualine_require.require = require
  --
  --   local icons = require("lazyvim.config").icons
  --
  --   vim.o.laststatus = vim.g.lualine_laststatus
  --
  --   opts.options = options
  --   opts.sections = sections
  --   -- sections = sections,
  --   -- lualine_y = {
  --   --   { "progress", separator = " ", padding = { left = 1, right = 0 } },
  --   --   { "location", padding = { left = 0, right = 1 } },
  --   -- },
  --   opts.sections.lualine_z = {
  --     function()
  --       return " " .. os.date("%R")
  --     end,
  --   }
  --
  --   -- do not add trouble symbols if aerial is enabled
  --   if vim.g.trouble_lualine then
  --     local trouble = require("trouble")
  --     local symbols = trouble.statusline
  --       and trouble.statusline({
  --         mode = "symbols",
  --         groups = {},
  --         title = false,
  --         filter = { range = true },
  --         format = "{kind_icon}{symbol.name:Normal}",
  --         hl_group = "lualine_c_normal",
  --       })
  --     table.insert(opts.sections.lualine_c, {
  --       symbols and symbols.get,
  --       cond = symbols and symbols.has,
  --     })
  --   end
  --
  --   return opts
  -- end,
}
