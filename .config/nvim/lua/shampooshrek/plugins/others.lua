return {
  -- { "artur-shaik/jc.nvim" },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
  },
  { "CRAG666/code_runner.nvim",         config = true },
  -- { "styled-components/vim-styled-components" },
  { "mg979/vim-visual-multi" },
  { "hoffs/omnisharp-extended-lsp.nvim" },
  {
    "TheLeoP/powershell.nvim",
    opts = {
      bundle_path = vim.fn.expand("~") .. "/.local/share/nvim/mason/packages/powershell-editor-services",
    },
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  }
}
