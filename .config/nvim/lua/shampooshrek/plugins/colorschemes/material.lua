return {
  "marko-cerovac/material.nvim",
  lazy = false,
  config = function()
    require("material").setup({
      disable = {
        background = false,
      },
      lualine_style = "stealth",
    })
  end,
}
