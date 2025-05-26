return {
  -- { "artur-shaik/jc.nvim" },
  {
    "norcalli/nvim-colorizer.lua",
    lazy = true,
    config = function()
      require("colorizer").setup()
    end,
  },
  { "CRAG666/code_runner.nvim",          config = true },
  -- { "styled-components/vim-styled-components" },
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
