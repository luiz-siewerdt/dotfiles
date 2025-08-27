return {
  "bluz71/vim-nightfly-colors",
  lazy = true,
  config = function()
    require("nightfly").custom_colors({
      bg = "NONE"
    })
  end,
}
