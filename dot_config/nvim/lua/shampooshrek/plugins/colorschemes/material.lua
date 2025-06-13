return {
  "marko-cerovac/material.nvim",
  lazy = false,
  config = function()
    require("material").setup({
      disable = {
        background = true,
      },
      lualine_style = "stealth",
    })
  end,
}
