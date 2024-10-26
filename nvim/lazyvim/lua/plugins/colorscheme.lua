local bg_color = "NONE"
local terminal_color = "#080810"

-- return {
--   "folke/tokyonight.nvim",
--   opts = {
--     transparent = true,
--     on_highlights = function(h1, c)
--       h1.NeoTreeNormal = {
--         bg = "NONE",
--       }
--       h1.NeoTreeNormalNC = {
--         bg = "NONE",
--       }
--       h1.NvimTreeSeparator = {
--         bg = "NONE",
--         fg = "NONE",
--         blend = 0,
--       }
--       h1.WhichKeyFloat = { bg = bg_color, fg = "#7dcfff" }
--       h1.WhichKeyNormal = { bg = bg_color, fg = "#7dcfff" }
--       h1.WhichKey = { bg = bg_color, fg = "#7dcfff" }
--       h1.TelescopeNormal = { bg = bg_color, fg = "#7dcfff" }
--       h1.TelescopeBorder = { bg = bg_color, fg = "#7dcfff" }
--       h1.TelescopePromptBorder = { bg = bg_color, fg = "#7dcfff" }
--       h1.TelescopePromptTitle = { bg = bg_color, fg = "#7dcfff" }
--       h1.TelescopeResultsComment = { bg = bg_color }
--
--       h1.FloatBorder = { bg = "NONE", fg = "#7dcfff" }
--       h1.NormalFloat = { bg = "NONE", fg = "#FFFFFF" }
--       -- h1.FloatTitle = { bg = bg_color, fg = "#000000" }
--       -- h1.Pmenu = { bg = bg_color, fg = c.fg }
--       --
--     end,
--     on_colors = function(colors)
--       colors.bg = "NONE"
--       colors.bg_dark = terminal_color
--       colors.bg_statusline = ""
--     end,
--   },
-- }

return {
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    opts = {
      flavour = "mocha",
      transparent_background = true,
      styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
        comments = { "italic" }, -- Change the style of comments
        conditionals = { "italic" },
        loops = { "italic" },
        functions = { "italic" },
        keywords = {},
        strings = {},
        variables = { "italic" },
        numbers = {},
        booleans = { "italic" },
        properties = { "italic" },
        types = { "italic" },
        operators = { "italic" },
        -- miscs = {}, -- Uncomment to turn off hard-coded styles
      },
      -- on_highlights = function(h1, c)
      --   h1.NeoTreeNormal = {
      --     bg = "NONE",
      --   }
      --   h1.NeoTreeNormalNC = {
      --     bg = "NONE",
      --   }
      --   h1.NvimTreeSeparator = {
      --     bg = "NONE",
      --     fg = "NONE",
      --     blend = 0,
      --   }
      --   h1.WhichKeyFloat = { bg = bg_color, fg = "#7dcfff" }
      --   h1.WhichKeyNormal = { bg = bg_color, fg = "#7dcfff" }
      --   h1.WhichKey = { bg = bg_color, fg = "#7dcfff" }
      --   h1.TelescopeNormal = { bg = bg_color, fg = "#7dcfff" }
      --   h1.TelescopeBorder = { bg = bg_color, fg = "#7dcfff" }
      --   h1.TelescopePromptBorder = { bg = bg_color, fg = "#7dcfff" }
      --   h1.TelescopePromptTitle = { bg = bg_color, fg = "#7dcfff" }
      --   h1.TelescopeResultsComment = { bg = bg_color }
      --
      --   h1.FloatBorder = { bg = "NONE", fg = "#7dcfff" }
      --   h1.NormalFloat = { bg = "NONE", fg = "#FFFFFF" }
      --   -- h1.FloatTitle = { bg = bg_color, fg = "#000000" }
      --   -- h1.Pmenu = { bg = bg_color, fg = c.fg }
      --   --
      -- end,
      -- on_colors = function(colors)
      --   colors.bg = "NONE"
      --   colors.bg_dark = terminal_color
      --   colors.bg_statusline = ""
      -- end,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
