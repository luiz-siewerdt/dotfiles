return {
  "nvim-lualine/lualine.nvim",
  lazy = false,
  dependencies = { "echasnovski/mini.icons" },
  config = function()
    local lualine = require("lualine")

    lualine.setup({
      options = {
        theme = "quiet",
      },
    })
  end,
}
