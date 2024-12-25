return {
  { "artur-shaik/jc.nvim" },
  { "norcalli/nvim-colorizer.lua" },
  { "CRAG666/code_runner.nvim" },
  { "styled-components/vim-styled-components" },
  { "mg979/vim-visual-multi" },
  {
    "sphamba/smear-cursor.nvim",
    event = "VeryLazy",
    cond = vim.g.neovide == nil,
    opts = {
      hide_target_hack = true,
      cursor_color = "none",
    },
    specs = {
      -- disable mini.animate cursor
      {
        "echasnovski/mini.animate",
        optional = true,
        opts = {
          cursor = { enable = false },
        },
      },
    },
  },
}
