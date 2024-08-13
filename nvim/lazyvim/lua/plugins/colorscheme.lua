local bg_color = "NONE"

return {
  "folke/tokyonight.nvim",
  opts = {
    transparent = true,
    on_highlights = function(h1, c)
      h1.NeoTreeNormal = {
        bg = "NONE",
      }
      h1.NeoTreeNormalNC = {
        bg = "NONE",
      }
      h1.NvimTreeSeparator = {
        bg = "NONE",
        fg = "NONE",
        blend = 0,
      }
      h1.WhichKeyFloat = { bg = bg_color, fg = "#7dcfff" }
      h1.WhichKeyNormal = { bg = bg_color, fg = "#7dcfff" }
      h1.WhichKey = { bg = bg_color, fg = "#7dcfff" }
      h1.TelescopeNormal = { bg = bg_color, fg = "#7dcfff" }
      h1.TelescopeBorder = { bg = bg_color, fg = "#7dcfff" }
      h1.TelescopePromptBorder = { bg = bg_color, fg = "#7dcfff" }
      h1.TelescopePromptTitle = { bg = bg_color, fg = "#7dcfff" }
      h1.TelescopeResultsComment = { bg = bg_color }
    end,
    on_colors = function(colors)
      colors.bg = "NONE"
      colors.bg_dark = "NONE"
      colors.bg_statusline = ""
    end,
  },
}
