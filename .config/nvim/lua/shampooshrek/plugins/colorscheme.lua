return {
  {
    "bluz71/vim-nightfly-colors",
    config = function()
      require("nightfly").custom_colors({})
    end,
  },
  {
    "folke/tokyonight.nvim",
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
        colors.bg = "#0d0d14"
        colors.bg_float = "#08080c"
      end,
    },
  },
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
      },
      color_overrides = {
        all = {
          base = "#0d0d14",
        },
      },
      integrations = {
        notify = true,
        blink_cmp = true,
        flash = true,
        fzf = true,
        mason = true,
        noice = true,
        neotest = true,
        dap = true,
        dap_ui = true,
        which_key = true,
      },
    },
  },
}
