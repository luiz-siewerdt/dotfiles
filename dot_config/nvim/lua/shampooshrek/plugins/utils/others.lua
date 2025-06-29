return {
  {
    "norcalli/nvim-colorizer.lua",
    lazy = false,
    config = function()
      require("colorizer").setup()
    end,
  },
  { "CRAG666/code_runner.nvim",          config = true },
  { "mg979/vim-visual-multi" },
  { "hoffs/omnisharp-extended-lsp.nvim", lazy = true },
  {
    "TheLeoP/powershell.nvim",
    lazy = true,
    opts = {
      bundle_path = vim.fn.expand("~") .. "/.local/share/nvim/mason/packages/powershell-editor-services",
    },
  },
}
