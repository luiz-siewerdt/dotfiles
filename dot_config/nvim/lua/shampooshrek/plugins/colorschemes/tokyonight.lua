return {
  "folke/tokyonight.nvim",
  lazy = true,
  opts = {
    transparent = true,
    styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
      -- comments = { "italic" }, -- Change the style of comments
      -- conditionals = { "italic" },
      -- loops = { "italic" },
      -- functions = { "italic" },
      -- keywords = {},
      -- strings = {},
      -- variables = { "italic" },
      -- numbers = {},
      -- booleans = { "italic" },
      -- properties = { "italic" },
      -- types = { "italic" },
      -- operators = { "italic" },
    },
    on_colors = function(colors)
      -- colors.bg = "#0d0d14"
      -- colors.bg_float = "#08080c"
    end,
  },
}
