return {
  "marko-cerovac/material.nvim",
  lazy = false,
  config = function()
    require("material").setup({
      disable = {
        background = true,
      },
      lualine_style = "stealth",
      custom_colors = function(colors)
        colors.editor.active = "NONE"
      end
    })
  end,
}
