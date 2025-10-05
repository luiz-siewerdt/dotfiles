return {
  "marko-cerovac/material.nvim",
  lazy = false,
  config = function()
    require("material").setup({
      disable = {
        -- background = true,
      },
      custom_highlights = {
        FlashLabel = { bg = "#84ffff", fg = "#000000" },
        FlashMatch = { bg = "#232637", fg = "#FFFFFF" },
        FlashCurrent = { bg = "NONE", fg = "#84ffff" },

        Search = { bg = "#232637", fg = "#ffffff" },
        IncSearch = { bg = "#bdc1d9", fg = "#000000" },
        PmenuSel = { fg = "#FFFFFF", bg = "#232637" }
      },
      lualine_style = "stealth",
      custom_colors = function(colors)
        colors.editor.active = "NONE"
      end
    })
  end,
}
