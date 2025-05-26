return {
  "lukas-reineke/indent-blankline.nvim",
  enabled = false,
  lazy = vim.fn.argc(-1) == 0,
  main = "ibl",
  ---@module "ibl"
  ---@type ibl.config
  opts = {},
}
